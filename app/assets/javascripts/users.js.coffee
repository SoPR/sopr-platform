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
    $body = $('body')
    bodyClass = $body.attr 'class'

    if bodyClass in ['registrations-edit', 'registrations-update']
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
    else if bodyClass is 'users-index'
        $(".usercard").equalHeights()
        $(document).keypress (event) ->
            $textSearch = $('#user-search-bar')

            if event.which is 13
                event.preventDefault() if $textSearch.val().trim() is ''
                $textSearch.val($textSearch.val().trim())
