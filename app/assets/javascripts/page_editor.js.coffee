class @PageEditor
  constructor: ->
    @form = $("#edit_page")
    @page_content = @form.find('#page_content')
    @addWymEditorAndBindUpdatePage() if @page_content.length > 0

  # first bind the wymeditor to page content
  # we need to update the content before submitting the form
  addWymEditorAndBindUpdatePage: ->
    @page_content.wymeditor basePath: "/assets/"

    @form.submit =>
      @page_content.html $.wymeditors(0).xhtml()
      true

jQuery ->
  @pageEditor = new PageEditor()
