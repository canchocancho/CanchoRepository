<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>encoding</title>
	<script src="resources/vendor/moviemasher/bower_components/opentype.js/dist/opentype.min.js"></script>
    <script src="resources/vendor/moviemasher/bower_components/script.js/dist/script.min.js"></script>
    <script src="resources/vendor/moviemasher/dist/moviemasher.min.js"></script>
    <script src="resources/vendor/moviemasher/app/app.js"></script>
    <style>canvas, textarea { width: 320px; height: 240px; }</style>
</head>
<body onload='mm_load()'>
    <canvas id='mm-canvas'></canvas>
    <textarea id='mm-textarea'></textarea>
    <div>
      <input type="range" step="0.001" value="0" min="0" max="0.1002" oninput="mm_player.position=this.value" />
      <button onclick="mm_player.paused = !mm_player.paused">Play/Pause</button>
    <div>
      <button onclick="add_media('title')">Add Title</button>
      <button onclick="add_media('cable')">Add Cable</button>
      <button onclick="add_media('frog')">Add Frog</button>
      <button onclick="add_media('globe')">Add Globe</button>
    </div>
  </body>
</html>