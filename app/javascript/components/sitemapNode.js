import React from 'react';
import PropTypes from 'prop-types';

const hasChildren = (item) => item.children && item.children.length;

const SitemapNode = ({ node }) => {
  return node.map((item) => (
      <ul>
        <li>
          <a href={item.path} id={item.id}>{item.link_name}</a>
          {hasChildren(item) && <SitemapNode node={item.children} />}
        </li>
      </ul>
    )
  )
};

SitemapNode.propTypes = {
  node: PropTypes.node,
};

export default SitemapNode;
