﻿<%@ Page Title="UserName:" Language="C#"  
    AutoEventWireup="true" CodeFile="AnimatedTitleScreen.aspx.cs" Inherits="UserProfilePage" %>

    <!DOCTYPE html>
    <head>
         <link href="Content/bootstrap-theme.css" rel="stylesheet" />
         <link href="Content/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
			body {
				color: #808080;
				font-family:Monospace;
				font-size:13px;
				text-align:center;
				background-color: #000;
				margin: 0px;
				overflow: hidden;
			}

			#info {
				position: absolute;
				top: 0px; width: 100%;
				padding: 5px;
				z-index: 100;
				color: #ddd;
				text-shadow: 0 0 1px rgba(0,0,0,1);
			}

			a {

				color: #0080ff;
			}

			b { color: lightgreen }

			#stats { position: absolute; top:0; left: 0 }

			.renderer_label {
				position: absolute;
				bottom: 1em;
				width: 100%;
				color: white;
				z-index: 10;
				display: block;
				text-align: center;
			}

			.renderer_label.renderer_label_normal {
			}
			.renderer_label.renderer_label_logzbuf {
			}
			#container {
				white-space: nowrap;
			}
			#container_normal {
				width: 80%;
				display: inline-block;
				position: relative;
				overflow: hidden;
			}
			#container_logzbuf {
				width: 80%;
				display: inline-block;
				position: relative;
				overflow: hidden;
			}
			#renderer_border {
				position: absolute;
				top: 0;
				bottom: 0;
				width: 2px;
				z-index: 10;
				opacity: .8;
				background: #ccc;
				border: 1px inset #ccc;
				cursor: col-resize;
               
			}
		</style>
    </head>
  <body>
      
      <br />
      [ <a href="Default.aspx"> Return to Home</a> ]
		<div id="container">
			<div id="container_normal"><h2 class="renderer_label renderer_label_normal"></h2></div>
            <div id="container_logzbuf"><h2 class="renderer_label renderer_label_logzbuf"></h2></div>
			<div id="renderer_border"></div>
                                  
		</div>
        
		<div id="info">
			<a href="http://threejs.org" target="_blank"></a> 
		</div>

        <script src="Scripts/jquery-2.1.1.min.js"></script>
        <script src="Scripts/jquery-2.1.1.js"></script>
        <script src="Scripts/three.min.js"></script>
        <script src="Scripts/three.js"></script>
        <script src="Scripts/stats.min.js"></script>
        <script src="Scripts/fonts/helvetiker_regular.typeface.js"></script>
        <script src="Scripts/js/modernizr.custom.js"></script>
		<script>

        
		 
		    // 1 micrometer to 100 billion light years in one scene, with 1 unit = 1 meter?  preposterous!  and yet...
		    var NEAR = 1e-6, FAR = 1e27;
		    var SCREEN_WIDTH = window.innerWidth;
		    var SCREEN_HEIGHT = window.innerHeight;
		    var screensplit = .25, screensplit_right = 0;
		    var mouse = [.5, .5];
		    var zoompos = -100, minzoomspeed = .015;
		    var zoomspeed = minzoomspeed;

		    var container, stats;
		    var objects = {};

		    // Generate a number of text labels, from 1µm in size up to 100,000,000 light years
		    // Try to use some descriptive real-world examples of objects at each scale

		    var labeldata = [
				{ size: 100, scale: 1.0, label: "Connect with friends", scale: 1 },
				{ size: 1000, scale: 1.0, label: "race in real time!!!!", scale: 1 },
				{ size: 10000, scale: 1.0, label: "Welcome to....", scale: 1 },
				{ size: 3400000, scale: 1.0, label: "RaceTracker", scale: 1  },
		    ];

		    init();
		    animate();

		    //redirectToReturnUrl();

		   // border.style.left = ( 100) + "%";
		    function init() {

		        container = document.getElementById('container');
		        $('#loading').html('<img src="Images/img/722.GIF"></img> loading...');
		        // Initialize two copies of the same scene, one with normal z-buffer and one with logarithmic z-buffer
		        objects.normal = initScene('normal', false);
		        objects.logzbuf = initScene('logzbuf', true);
                
		        stats = new Stats();
		        container.appendChild(stats.domElement);

		        // Resize border allows the user to easily compare effects of logarithmic depth buffer over the whole scene
		        border = document.getElementById('renderer_border');
		        border.addEventListener("mousedown", onBorderMouseDown);

		        window.addEventListener('resize', onWindowResize, false);
		        window.addEventListener('mousewheel', onMouseWheel, false);
		        window.addEventListener('DOMMouseScroll', onMouseWheel, false);
		        window.addEventListener('mousemove', onMouseMove, false);

		        render();
		        window.HTMLButtonElement.constructor();
		    }

		    function initScene(name, logDepthBuf) {

		        var scene = new THREE.Scene();
		        var framecontainer = document.getElementById('container_' + name);

		        var camera = new THREE.PerspectiveCamera(50, screensplit * SCREEN_WIDTH / SCREEN_HEIGHT, NEAR, FAR);
		        scene.add(camera);

		        var light = new THREE.DirectionalLight(0xffffff, 1);
		        light.position.set(100, 100, 100);
		        scene.add(light);

		        var materialargs = {
		            color: 0xffffff,
		            specular: 0xffaa00,
		            shininess: 50,
		            shading: THREE.SmoothShading,
		            emissive: 0x000000
		        };

		        var geomtransform = new THREE.Matrix4();
		        var tmpvec = new THREE.Vector3();
		        var meshes = [];
		        var coloroffset = 0;
		        var colorskip = ['black', 'antiquewhite', 'bisque', 'beige', 'blanchedalmond', 'darkblue', 'darkcyan'];
		        var colorkeys = Object.keys(THREE.ColorKeywords);

		        for (var i = 0; i < labeldata.length; i++) {
		            var scale = labeldata[i].scale || 1;
		            var labelgeo = new THREE.TextGeometry(labeldata[i].label, {
		                size: labeldata[i].size,
		                height: labeldata[i].size / 2,
		                font: 'helvetiker',
		            });
		            labelgeo.computeBoundingSphere();

		            // center text
		            geomtransform.setPosition(tmpvec.set(-labelgeo.boundingSphere.radius, 0, 0));
		            labelgeo.applyMatrix(geomtransform);

		            // Pick a color at "random".  Exclude black, because it looks bad.
		            while (colorskip.indexOf(colorkeys[i + coloroffset]) != -1) {
		                coloroffset++;
		            }
		            materialargs.color = THREE.ColorKeywords[colorkeys[i + coloroffset]];

		            var material = new THREE.MeshPhongMaterial(materialargs);

		            var textmesh = new THREE.Mesh(labelgeo, material);
		            textmesh.scale.set(scale, scale, scale);
		            textmesh.position.z = -labeldata[i].size * scale;
		            textmesh.position.y = labeldata[i].size / 4 * scale;
		            textmesh.updateMatrix();

		            var dotmesh = new THREE.Mesh(new THREE.SphereGeometry(labeldata[i].size * scale / 2, 24, 12), material);
		            dotmesh.position.y = -labeldata[i].size / 4 * scale;
		            dotmesh.updateMatrix();

		            var merged = new THREE.Geometry();
		            merged.merge(textmesh.geometry, textmesh.matrix);
		            merged.merge(dotmesh.geometry, dotmesh.matrix);

		            var mesh = new THREE.Mesh(merged, material);
		            mesh.position.z = -labeldata[i].size * 1 * scale;

		            scene.add(mesh);
		        }

		        var renderer = new THREE.WebGLRenderer({ antialias: true, logarithmicDepthBuffer: logDepthBuf });
		        renderer.setSize(SCREEN_WIDTH / 2, SCREEN_HEIGHT);
		        renderer.domElement.style.position = "relative";
		        renderer.domElement.id = 'renderer_' + name;
		        framecontainer.appendChild(renderer.domElement);

		        return { container: framecontainer, renderer: renderer, scene: scene, camera: camera }
		    }

		    function updateRendererSizes() {

		        // Recalculate size for both renderers when screen size or split location changes

		        SCREEN_WIDTH = window.innerWidth;
		        SCREEN_HEIGHT = window.innerHeight;

		        screensplit_right = 1 - screensplit;

		        objects.normal.renderer.setSize(screensplit * SCREEN_WIDTH, SCREEN_HEIGHT);
		        objects.normal.camera.aspect = screensplit * SCREEN_WIDTH / SCREEN_HEIGHT;
		        objects.normal.camera.updateProjectionMatrix();
		        objects.normal.camera.setViewOffset(SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, SCREEN_WIDTH * screensplit, SCREEN_HEIGHT);
		        objects.normal.container.style.width = (screensplit * 100) + '%';

		        objects.logzbuf.renderer.setSize(screensplit_right * SCREEN_WIDTH, SCREEN_HEIGHT);
		        objects.logzbuf.camera.aspect = screensplit_right * SCREEN_WIDTH / SCREEN_HEIGHT;
		        objects.logzbuf.camera.updateProjectionMatrix();
		        objects.logzbuf.camera.setViewOffset(SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIDTH * screensplit, 0, SCREEN_WIDTH * screensplit_right, SCREEN_HEIGHT);
		        objects.logzbuf.container.style.width = (screensplit_right * 100) + '%';

		        border.style.left = (screensplit * 100) + "%";

		    }

		    function animate() {

		        requestAnimationFrame(animate);
		        render();
		    }

		    function render() {

		        // Put some limits on zooming
		        var minzoom = labeldata[0].size * labeldata[0].scale * 1;
		        var maxzoom = labeldata[labeldata.length - 1].size * labeldata[labeldata.length - 1].scale * 100;
		        var damping = (Math.abs(zoomspeed) > minzoomspeed ? .95 : 1.0);

		        // Zoom out faster the further out you go
		        var zoom = THREE.Math.clamp(Math.pow(Math.E, zoompos), minzoom, maxzoom);
		        zoompos = Math.log(zoom);

		        // Slow down quickly at the zoom limits
		        if ((zoom == minzoom && zoomspeed < 0) || (zoom == maxzoom && zoomspeed > 0)) {
		            damping = .85;
		        }

		        zoompos += zoomspeed;
		        zoomspeed *= damping;

		        objects.normal.camera.position.x = Math.sin(.5 * Math.PI * (mouse[0] - .5)) * zoom;
		        objects.normal.camera.position.y = Math.sin(.25 * Math.PI * (mouse[1] - .5)) * zoom;
		        objects.normal.camera.position.z = Math.cos(.5 * Math.PI * (mouse[0] - .5)) * zoom;
		        objects.normal.camera.lookAt(objects.normal.scene.position);

		        // Clone camera settings across both scenes
		        objects.logzbuf.camera.position.copy(objects.normal.camera.position);
		        objects.logzbuf.camera.quaternion.copy(objects.normal.camera.quaternion);

		        // Update renderer sizes if the split has changed
		        if (screensplit_right != 1 - screensplit) {
		            updateRendererSizes();
		        }

		        objects.normal.renderer.render(objects.normal.scene, objects.normal.camera);
		        objects.logzbuf.renderer.render(objects.logzbuf.scene, objects.logzbuf.camera);

		        stats.update();

		    }

		    function onWindowResize(event) {
		        updateRendererSizes();
		    }

		    function onBorderMouseDown(ev) {
		        // activate draggable window resizing bar
		        window.addEventListener("mousemove", onBorderMouseMove);
		        window.addEventListener("mouseup", onBorderMouseUp);
		        ev.stopPropagation();
		        ev.preventDefault();
		    }
		    function onBorderMouseMove(ev) {
		        screensplit = Math.max(0, Math.min(1, ev.clientX / window.innerWidth));
		        ev.stopPropagation();
		    }
		    function onBorderMouseUp(ev) {
		        window.removeEventListener("mousemove", onBorderMouseMove);
		        window.removeEventListener("mouseup", onBorderMouseUp);
		    }
		    function onMouseMove(ev) {
		        mouse[0] = ev.clientX / window.innerWidth;
		        mouse[1] = ev.clientY / window.innerHeight;
		    }
		    function onMouseWheel(ev) {
		        var amount = -ev.wheelDeltaY || ev.detail;
		        var dir = amount / Math.abs(amount);
		        zoomspeed = dir / 10;

		        // Slow down default zoom speed after user starts zooming, to give them more control
		        minzoomspeed = 0.001;
		    }
		    function redirectToReturnUrl() {
		        this.window.location.replace("Default.aspx");
		    }
        </script>
	</body>
    </html>

