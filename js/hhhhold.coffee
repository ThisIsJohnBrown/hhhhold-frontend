$(document).ready ->

	viewportWidth = $(window).width()
	viewportHeight = $(window).height()

	$('.right, .left').css('height', viewportHeight)
	$('.right .inside').css('height', viewportHeight - 100)

	wizardry = (width, height, params) ->

			if viewportWidth < 500
				framePadding = 20
			else
				framePadding = 150

			minImgWidth = (viewportWidth / 2) - framePadding * 2
			maxImgWidth = (viewportWidth / 2) - framePadding
			minImgHeight = viewportHeight / 3
			maxImgHeight = viewportHeight - framePadding

			width ?= Math.floor(Math.random() * (maxImgWidth - minImgWidth + 1) + minImgWidth)
			height?= Math.floor(Math.random() * (maxImgHeight - minImgHeight + 1) + minImgHeight)

			img = (new Image())

			if not params
				img.src = "http://hhhhold.com/#{width}x#{height}?homepage=true"
				url = "hhhhold.com/#{width}x#{height}"
			else
				img.src = "http://hhhhold.com/#{params}?homepage=true"
				url = "hhhold.com/#{params}"

			$('.hhhhold-up img').fadeOut('slow', ->
				$(this).remove()
			)

			$(img).load( -> 
				if $('.hhhhold-up img').length < 1

					width = img.width
					height = img.height

					topOffset = ((viewportHeight - height) / 2) - 35
					leftOffset = (((viewportWidth / 2) - width) / 2) - 12

					$('.top').css(top: topOffset, left: leftOffset)
					$('.top').css(width: width, height: height)
					$('.hhhhold-up').css(width: width, height: height)
					$('.top h1').css(width: width, lineHeight: height + 'px', fontSize: width/6 + 'px')
					$('.caption').text(url)

					$(img).hide().appendTo('.hhhhold-up').delay(300).fadeIn('slow')
			)


	wizardry()

	$('.top').on('click', ->
		wizardry()
	)
	$('li[data-params], span[data-params]').on('click', ->
		wizardry(width=null, height=null, params=$(this).data('params'))
	)