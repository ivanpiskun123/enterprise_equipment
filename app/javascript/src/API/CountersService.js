import axios from 'axios'

export default class CountersService {
  static async getAll() {
    const response = await axios.get('/counters');
    return response.data.data
  }

}
