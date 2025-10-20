{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
    onEntrypointLoaded: async function(engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();

    var personalparent = document.querySelector('#personalparent');
    personalparent.classList.add('personalfadeout');
    await appRunner.runApp();
  }
});