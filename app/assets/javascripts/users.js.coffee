toggleTab = (targetClass) ->
    $footer = $('div.profile-footer')
    $nav = $footer.find('ul.nav')
    $nav.find('.active').removeClass 'active'
    $nav.find(".tab-#{targetClass}").addClass 'active'

toggleTabPanel = (targetClass) ->
    $('div.tab-pane.active').removeClass 'active'
    $("div.tab-pane.#{targetClass}").addClass 'active'

updateFormAction = (targetClass) ->
    $('#edit_user').attr 'action', "/users##{targetClass}"

updateLocationHash = (hash) ->
    window.location.hash = hash

$ ->
    targetClass = window.location.hash.substr(1)

    unless targetClass
        targetClass = 'account'

    toggleTab(targetClass)
    toggleTabPanel(targetClass)
    updateFormAction(targetClass)
    updateLocationHash(targetClass)

    $(".nav a").click (event) ->
        event.preventDefault()
        $this = $(event.currentTarget)
        $parent = $this.parent()
        targetClass = $this.data 'target-class'

        toggleTab(targetClass)
        toggleTabPanel(targetClass)
        updateFormAction(targetClass)
        updateLocationHash(targetClass)
