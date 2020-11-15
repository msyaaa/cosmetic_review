crumb :root do
  link "ホーム", root_path
end
crumb :posts do
  link "クチコミ一覧", posts_path
  parent :root
end

crumb :post_show do |post|
  link post.name, post_path(post)
  parent :posts
end

crumb :user do |user| 
  link user.nickname, user_path(user)
  parent :root
end

# 親カテゴリーのパンくず
crumb :parent_category do |category|
  category = Category.find(params[:id]).root
  link "#{category.name}", search_post_path(category)
  parent :root
end

# 子カテゴリーのパンくず
crumb :child_category do |category|
  category = Category.find(params[:id])
  # 表示しているページが子カテゴリーの一覧ページの場合
  if category.has_children?
    link "#{category.name}", search_post_path(category)
    parent :parent_category

  # 表示しているページが孫カテゴリーの一覧ページの場合
  else
    link "#{category.parent.name}", search_post_path(category.parent)
    parent :parent_category
  end
end

# 孫カテゴリーのパンくず
crumb :grandchild_category do |category|
  category = Category.find(params[:id])
  link "#{category.name}", search_post_path(category)
  parent :child_category
end

crumb :post_new do
  link "新しいクチコミ投稿", new_post_path
  parent :root
end

crumb :name_search do |search|
  if search == ""
    link "クチコミ検索結果", name_search_posts_path
  else
    link "「#{search}」のクチコミ検索結果", name_search_posts_path
  end
  parent :posts
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).