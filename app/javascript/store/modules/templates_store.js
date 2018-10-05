import axios from 'axios'

import { Utils } from '../../lib/utils'
import { Template, TemplatesList } from '../../models/template'

const TemplatesStore = {
  namespaced: true,
  state: {
    templates: new TemplatesList(),
    template: new Template(),
    editable: false,
    status: ''
  },
  getters: {
    templates: state => state.templates,
    template: state => state.template,
    editable: state => state.editable,
    status: state => state.status
  },
  mutations: {
    edit(state) {
      state.template.editable = true
      return state
    },
    one(state, template_id) {
      state.template = state.templates.find({ id: template_id })
      return state
    },
    many(state, data) {
      state.templates.replace(data)
      state.status = 'ok'
      return state
    },
    progress(state, flag) {
      state.status = flag
      return state
    },

  },
  actions: {
    index(context) {
      return new Promise((resolve, reject) => {
        context.commit('progress', 'loading')

        axios.get(context.state.templates.getFetchURL())
          .then(response => {
            let data = Utils.modelsFromResponse(response.data.data)

            context.commit('many', data)
          })
          .catch(error => {
            reject(error)
          })
      })
    }

  }
}

export default TemplatesStore