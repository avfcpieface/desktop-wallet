<template>
  <div
    v-click-outside="emitClose"
    :class="{
      'AppSidemenuPlugins--horizontal': isHorizontal,
      'AppSidemenuPlugins': !isHorizontal,
      'AppSidemenuPlugins--single': pluginMenuItems.length === 1
    }"
    class="absolute z-20 theme-dark"
  >
    <MenuOptions
      :is-horizontal="isHorizontal"
      :is-settings="true"
      :single-column="false"
      class="whitespace-no-wrap"
    >
      <div
        v-for="(columnItems, columnId) in pluginMenuItems"
        :key="columnId"
      >
        <MenuOptionsItem
          v-for="(menuItem, menuId) in columnItems"
          :key="menuId"
          :title="menuItem.title"
          @click="navigateToRoute(menuItem.routeName)"
        />
      </div>
    </MenuOptions>
  </div>
</template>

<script>
import { chunk } from 'lodash'
import { MenuOptions, MenuOptionsItem } from '@/components/Menu'

export default {
  name: 'AppSidemenuPlugins',

  components: {
    MenuOptions,
    MenuOptionsItem
  },

  props: {
    outsideClick: {
      type: Boolean,
      required: false,
      default: false
    },

    isHorizontal: {
      type: Boolean,
      required: false,
      default: false
    },

    itemsPerColumn: {
      type: Number,
      required: false,
      default: 5
    }
  },

  computed: {
    pluginMenuItems () {
      return chunk(this.$store.getters['plugin/menuItems'], this.itemsPerColumn)
    }
  },

  methods: {
    navigateToRoute (routeName) {
      this.$emit('close')
      this.$router.push({ name: routeName })
    },

    emitClose () {
      if (this.outsideClick) {
        this.$emit('close')
      }
    }
  }
}
</script>

<style lang="postcss" scoped>
.AppSidemenuPlugins {
  left: 6.5rem;
  top: 19rem;
  transform: translateY(-10%);
}

.AppSidemenuPlugins--single {
  top: 22.2rem;
}

.AppSidemenuPlugins--horizontal {
  width: 300px;
  right: 8.5rem;
  top: 5.75rem;
}
</style>
