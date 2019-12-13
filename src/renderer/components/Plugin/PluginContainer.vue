<template>
  <div>
    <KeepAlive>
      <webview
        :src="url"
        webpreferences="devTools"
      />
    </KeepAlive>
  </div>
</template>

<script>
export default {
  name: 'PluginContainer',

  computed: {
    url () {
      return `${process.env.NODE_ENV === 'development' ? 'http://localhost:9801' : ''}/plugin.html`
    }
  },

  watch: {
    url () {
      console.log('plugin watch url', this.url)
    }
  }
}
</script>
