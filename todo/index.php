<?php

?>

<html>
<head>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$(".check").hide();

			// onmouseover the options div
			$(".ops").mouseover(function() {
				$(this).children(".hiddenops").css({'visibility':'visible'}).fadeIn('slow');
			});

			// Add a new task on button click
			$("#newbtn").click(addNewTask);

			// Adds a new task to the task list
			function addNewTask() {
				$(".tasklist").append(function() {

					// remove the initial button
					$("#newbtn").remove();
					
					// add the button with event attached
					$newbtn = $("<input id='newbtn' type='button' value='new task'>");
					$newbtn.click(addNewTask);

					// add new task with button appended
					$newtask = $(
						"<div class='task'>"+
							"<div class='test ops'>"+
								"<img class='check' src='images/check.png' width='23' height='24' alt=''>"+
							"</div>"+
							"<input class='taskdesc' type='text'>"+
						"</div>"
					);
					$newtask.append($newbtn);

					return $newtask;
				});
			}
		});
	</script>
	<style type="text/css">
	
		.container {
			height: 100%;
		}
		
		#newbtn {
			margin-left: 10px;
		}

		.test {
			outline: 2px solid black;
		}

		.tasklist {
			
		}

		.taskdesc {
			float: left;
			width: 300px;
			outline: 2px solid blue;
		}

		.task {
			height: 28px;
			width: 500px;
			padding: 0px 0px 0px 100px;
		}

		.ops {
			display: inline-block;
			width: 100px;
			float: left;
		}

		/* need to adjust for ie */
		.check {
			vertical-align: sub;
		}
	</style>
</head>
<body>
	<div class="test container">
		<p>Add a task</p>
		<div class="tasklist" id="top">
			<div class="task">
				<div class="test ops">
					<img class="check" src="images/check.png" width="23" height="24" alt="">
				</div>
				<input class="taskdesc" type="text" />
				<input id="newbtn" type="button" value="new task"/>
			</div>
		</div>
	</div>
</body>
</html>
