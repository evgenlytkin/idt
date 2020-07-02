import React, { Component } from 'react';
import PropTypes from 'prop-types';

import getSitemapValues from './api/sitemap';
import SitemapNode from './sitemapNode';

class Sitemap extends Component {
  state = {
    data: null,
    isLoaded: false,
    error: null
  };

  componentDidMount() {
    getSitemapValues().then(
      (response) => {
        this.setState({ isLoaded: true, data: response.data })
      },
      (error) => {
        this.setState({ isLoaded: true, error: error.response.data })
      }
    );
  }

  render () {
    const { data, isLoaded, error } = this.state;

    if (error) {
      return <div>Error: {error.message}</div>;
    } else if (!isLoaded) {
      return <div>Loading...</div>;
    } else {
      return (data && <SitemapNode node={[data]}/>)
    }
  }
}

Sitemap.propTypes = {
  greeting: PropTypes.string,
};

export default Sitemap;
