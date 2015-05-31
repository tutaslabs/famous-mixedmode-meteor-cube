Meteor.startup  ->
  class App.app extends Famous.Node
    constructor: (@options) ->
      super @options


# Add a child node to add our mesh to.
      @buildBox(this)

    buildBox: (node) ->

# Add a camera to our scene for perspective rendering.

      camera = new Famous.Camera(node).setDepth(2000)


# Add light component to our scene.

      lightNode = node.addChild().setAlign(0.5, 0.5, 0.5).setPosition(0, 0, 250)

      light = new Famous.PointLight(lightNode).setColor(new Famous.Color('lightblue'))

      @m = node.addChild().setOrigin(0.5, 0.5, 0.5).setAlign(0.5, 0.5, 0.5).setMountPoint(0.5, 0.5, 0.5).setSizeMode(1, 1, 1).setAbsoluteSize(400, 400, 400)

      # Add mesh to our scene.

      @meshNode = @m.addChild().setOrigin(0.5, 0.5, 0.5).setAlign(0.5, 0.5, 0.5).setMountPoint(0.5, 0.5, 0.5).setSizeMode(1, 1, 1).setAbsoluteSize(400, 400, 400)

      @meshNode.setOpacity .95
      mesh = new Famous.Mesh(@meshNode).setGeometry('Box')
      mesh.setBaseColor new Famous.Color 'lightblue'


      @screenNode = @m.addChild().setOrigin(0.5, 0.5, 0.505).setAlign(0.5, 0.5, 0.505).setMountPoint(0.5, 0.5,0).setSizeMode(1, 1, 1).setAbsoluteSize(400, 400, 400)

# add a DOMElement to our meshnode
      element = new Famous.DOMElement @screenNode,
          tagName: 'iframe'
      element.setProperty 'background-color', 'lightgrey'
      element.setAttribute 'src','http://famo.us/'
      element.setProperty 'overflow','hidden'
      element.setProperty 'border','none'
      element.setProperty 'backface-visibility', 'none'


      dommesh = new Famous.Mesh(@screenNode).setGeometry('Plane').setBaseColor(new Famous.Color('lightblue').setOpacity(0))


# Save reference to our Famous clock

      @clock = Famous.Engine.getClock()

# Define update loop

      @clock.setInterval =>
          time = @clock.getTime()


          @m.setRotation 0,(time/2000),0
      ,20

#          @m.setRotation time / 2000, time / 1800,time / 1600

