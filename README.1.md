<% if params[:id].nil? %>
              <li><%= link_to "基本情報修正", basic_info_url %></li>
            <% else %>
              <li><%= link_to "基本情報の修正", basic_info_url(params:{id: @user.id}) %></li>
            <% end %>
            
            
            
            watasan
<% if params[:id].nil? %>
              <li><%= link_to "基本情報修正", basic_info_url %></li>
            <% else %>
              <li><%= link_to "基本情報の修正", basic_info_url(params:{id: @user.id}) %></li>
            <% end %>
            
            
            
            
            edit-basic-info/:id
            
            
watasan

<% if params[:id].nil? %>
              <li><%= link_to "基本情報修正", edit-basic-info/:id %></li>
            <% else %>
              <li><%= link_to "基本情報の修正", edit-basic-info/:id(params:{id: @user.id}) %></li>
            <% end %>
            
            
            
<li><% link_to "基本情報修正", basic_info_path(params:{id: @user.id}) %></li>