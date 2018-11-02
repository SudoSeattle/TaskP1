import Vue from 'vue'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  const app = new Vue({
    el,
    render: h => h(App)
  })

  console.log(app)
})

// import Vue from 'vue/dist/vue.esm.js'
// import App from '../app.vue'
//
// 
//
// import { ApolloClient } from 'apollo-client'
// import { HttpLink } from 'apollo-link-http'
// import { InMemoryCache } from 'apollo-cache-inmemory'
// import VueApollo from 'vue-apollo'
//
// const httpLink = new HttpLink({
//
//   uri: 'http://localhost:3000/graphql',
// })
//
//
// const apolloClient = new ApolloClient({
//   link: httpLink,
//   cache: new InMemoryCache(),
//   connectToDevTools: true,
// })
//
// const apolloProvider = new VueApollo({
//   defaultClient: apolloClient,
// })
//
//
// Vue.use(VueApollo)
//
// new Vue({
//   el: '#app',
//   provide: apolloProvider.provide(),
//   components: {
//     App
//   },
//   router,
//
//   template: '<App/>'
// })
