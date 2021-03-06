<template>
  <div class="WalletBusinessBridgechains">
    <WalletBusinessBridgechainsTable
      :current-page="currentPage"
      :rows="fetchedBridgechains"
      :total-rows="totalCount"
      :is-loading="isLoading"
      :is-remote="true"
      :has-pagination="totalCount > 0"
      :sort-query="{
        field: queryParams.sort.field,
        type: queryParams.sort.type
      }"
      :per-page="tableRowCount"
      @on-per-page-change="onPerPageChange"
      @on-page-change="onPageChange"
      @on-sort-change="onSortChange"
    />
  </div>
</template>

<script>
import { isEqual } from 'lodash'
import WalletBusinessBridgechainsTable from './WalletBusinessBridgechainsTable'

export default {
  name: 'WalletBusinessBridgechains',

  components: {
    WalletBusinessBridgechainsTable
  },

  data: () => ({
    currentPage: 1,
    isFetching: false,
    isLoading: false,
    fetchedBridgechains: [],
    expiryEvents: [],
    totalCount: 0,
    queryParams: {
      page: 1,
      limit: 10,
      sort: {
        field: 'timestamp',
        type: 'desc'
      }
    }
  }),

  computed: {
    tableRowCount: {
      get () {
        return this.$store.getters['session/transactionTableRowCount']
      },
      set (count) {
        this.$store.dispatch('session/setTransactionTableRowCount', count)

        this.$store.dispatch('profile/update', {
          ...this.session_profile,
          transactionTableRowCount: count
        })
      }
    }
  },

  watch: {
    // This watcher would invoke the `fetch` after the `Synchronizer`
    wallet_fromRoute (newValue, oldValue) {
      if (newValue.address !== oldValue.address) {
        this.reset()
        this.loadBridgechains()
      }
    }
  },

  created () {
    this.loadBridgechains()
    this.$eventBus.on('wallet:reload', this.loadBridgechains)
  },

  beforeDestroy () {
    this.$eventBus.off('wallet:reload', this.loadBridgechains)
  },

  methods: {
    async fetchBridgechains () {
      // If we're already fetching, it's unneccessary to fetch again
      if (this.isFetching) {
        return
      }

      let address, publicKey
      if (this.wallet_fromRoute) {
        address = this.wallet_fromRoute.address.slice()
        publicKey = this.wallet_fromRoute.publicKey
      }

      this.isFetching = true

      try {
        const { limit, page, sort } = this.queryParams
        const response = await this.$client.fetchBusinessBridgechains(publicKey, {
          page,
          limit,
          orderBy: `${sort.field}:${sort.type}`
        })

        if (this.wallet_fromRoute && address === this.wallet_fromRoute.address) {
          this.$set(this, 'fetchedBridgechains', response.data)
          this.totalCount = response.meta.totalCount
        }
      } catch (error) {
        this.$set(this, 'fetchedBridgechains', [])
        this.totalCount = 0
      } finally {
        this.isFetching = false
        this.isLoading = false
      }
    },

    /**
     * Fetch the bridgechains and show the loading animation while the response
     * is received
     */
    async loadBridgechains () {
      if (!this.wallet_fromRoute || this.isFetching) {
        return
      }

      this.isLoading = true
      this.fetchBridgechains()
    },

    onPageChange ({ currentPage }) {
      this.currentPage = currentPage
      this.__updateParams({ page: currentPage })
      this.loadBridgechains()
    },

    onPerPageChange ({ currentPerPage }) {
      this.tableRowCount = currentPerPage
      this.__updateParams({ limit: currentPerPage, page: 1 })
      this.loadBridgechains()
    },

    onSortChange ({ source, field, type }) {
      if (!source) {
        return
      }

      if (!isEqual({ field, type }, this.queryParams.sort)) {
        this.__updateParams({
          sort: {
            field,
            type
          },
          page: 1
        })
        this.loadBridgechains()
      }
    },

    reset () {
      this.currentPage = 1
      this.queryParams.page = 1
      this.totalCount = 0
      this.fetchedBridgechains = []
    },

    __updateParams (newProps) {
      if (!newProps || typeof newProps !== 'object' || newProps === null) {
        return
      }

      this.queryParams = Object.assign({}, this.queryParams, newProps)
    }
  }
}
</script>
