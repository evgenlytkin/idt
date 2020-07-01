import axios from 'axios';

import { BASE_URL } from '../constants/api';

const baseRequest = axios.create({
  baseURL: BASE_URL,
});

const getSitemapValues = () => baseRequest.get('/sitemap').then(response => response.data);

export default getSitemapValues;
