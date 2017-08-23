

page = new ParallaxPageComponent
	frame: Screen.frame
	parallaxOrigin: z: 200 # defines overall strength of parallax (relative to 'z'-values)
	backgroundColor: "white"
	scrollVertical: false


# Add pages
for i in [0...10]

	pageContainer = new Layer
		size: page.size
		backgroundColor: "white"
		style: border: "1px inset"

	# Set 'z'-property to add parallax:

	imageMask = new Layer
		parent: pageContainer
		point: Align.center
		size: 325
		clip: true
		borderRadius: 10
		z: 50 # enables parallax effect for this layer

	image = new Layer
		parent: imageMask
		point: Align.center
		size: 450
		image: Utils.randomImage() # doesnt always load, so we'll add
		backgroundColor: Utils.randomColor().darken(20) # as a fallback
		z: -50 # parallax effect relative to its parent

	counter = new TextLayer
		parent: image
		point: Align.center()
		text: i + 1
		textAlign: "center"
		fontSize: 100
		fontWeight: 200
		color: "white"
		height: 130
		z: 250

	label = new TextLayer
		text: "Photo"
		fontSize: 38
		fontWeight: 800
		color: "black"
		parent: pageContainer
		z: 25
		y: imageMask.y - 70
		x: imageMask.x + 20

	page.addPage(pageContainer, "right")


