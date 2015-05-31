Template.main.rendered = ->

  scene = Famous.Engine.createScene()

# our top level node
  scene.addChild new App.app()

  Famous.Engine.init()




