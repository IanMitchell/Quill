# Stores Admin Bar Form Data
saveAdminBar = ->
  # New Post
  window.Store.set 'post-title', $('#post_title').val()
  window.Store.set 'post-content', $('#post_content').val()

  # New Page
  window.Store.set 'page-title', $('#page_title').val()
  if $('#page_header').prop('checked')
    window.Store.set 'page-header', 'true'
  else
    window.Store.set 'page-header', 'false'
  if $('#page_sidebar').prop('checked')
    window.Store.set 'page-sidebar', 'true'
  else
    window.Store.set 'page-sidebar', 'false'

  window.Store.set 'page-content', $('#page_content').val()

# Load the Data
$(document).ready ->
  # New Post
  if window.Store.get('post-title')
    $('#post_title').val window.Store.get('post-title')
  
  if window.Store.get('post-content')
    $('#post_content').text window.Store.get('post-content')

  # New Page
  if window.Store.get('page-title')
    $('#page_title').val window.Store.get('page-title')

  if window.Store.get('page-header') is 'true'
    $('#page_header').prop('checked', true)

  if window.Store.get('page-sidebar') is 'true'
    $('#page_sidebar').prop('checked', true)
  
  if window.Store.get('page-content')
    $('#page_content').text window.Store.get('page-content')


  # Call function every 5s
  setInterval(saveAdminBar, ms('5s')); 
  return