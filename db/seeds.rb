# frozen_string_literal: true

sitemap_values = {
  link_name: 'Home',
  path: '/',
  children: [
    {
      link_name: 'Settings',
      path: 'settings',
      children: [
        {
          link_name: 'Company Profile',
          path: 'company_profile',
        },
        {
          link_name: 'Switches',
          path: 'switches',
        }
      ]
    },
    {
      link_name: 'Help',
      path: 'help',
      children: [
        {
          link_name: 'Tickets',
          path: 'tickets',
          children: [
            {
              link_name: 'Create a Ticket',
              path: 'create',
            }
          ]
        },
        {
          link_name: 'FAQ',
          path: 'faq',
        }
      ]
    },
  ]
}

def populate_children_recursively(sitemap_children, parent_id = nil)
  sitemap_instance = Sitemap.find_or_create_by(
    link_name: sitemap_children[:link_name], path: sitemap_children[:path], parent_id: parent_id
  )

  sitemap_children[:children]&.each do |sitemap_child|
    populate_children_recursively(sitemap_child, sitemap_instance.id)
  end
end

populate_children_recursively(sitemap_values)
