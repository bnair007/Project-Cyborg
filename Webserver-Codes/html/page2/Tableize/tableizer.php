<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en-US">
<head>
	<title>Your Results | TABLEIZER! Spreadsheets to HTML Tables Tool</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="Description" content="Convert spreadsheet cells to HTML tables by copy and paste.">
	<meta name="Keywords" content="html, tables, spreadsheets, convert, html tables, excel, calc, export, css, tools, code, web design, web development">
	<link rel="canonical" href="http://tableizer.journalistopia.com/" />
	<link href='https://fonts.googleapis.com/css?family=Raleway:400,600' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="http://192.168.133.177/page2/Tableize/styles.css" type="text/css" />
	<script type="text/javascript">
		//Selects entire textarea.
		function SelectAll(id) {
				document.getElementById(id).focus();
				document.getElementById(id).select();
		}
	</script>			
</head>
<body>
	<div id="header">
		<h1 id="site-name">TABLEIZER!</h1>
		<h2 id="site-label">A Quick Spreadsheets-to-HTML &lt;Table&gt; Tool</h2>
	</div>	
	<div id="container">	
		<div class="options-buttons-area">
			<a href="/" class="options-button"><< Tableize Again</a>
		</div>

		<div id="wrapper">
			
			<p class="site-instruction">Copy the HTML code below:</p>
			
			<textarea id="table-code" onClick="SelectAll('table-code');" title="Copy the table HTML code here">
&lt;style type=&quot;text/css&quot;&gt;
	table.tableizer-table {
		font-size: ;
		border: 1px solid #CCC; 
		font-family: ;
	} 
	.tableizer-table td {
		padding: 4px;
		margin: 3px;
		border: 1px solid #CCC;
	}
	.tableizer-table th {
		background-color: #; 
		color: #FFF;
		font-weight: bold;
	}
&lt;/style&gt;
&lt;table class=&quot;tableizer-table&quot;&gt;
&lt;thead&gt;&lt;tr class=&quot;tableizer-firstrow&quot;&gt;&lt;th&gt;&lt;/th&gt;&lt;/tr&gt;
&lt;/tbody&gt;&lt;/table&gt;</textarea>

			<div class="options-buttons-area">
				<button class="options-button clipboard-button" data-copytarget="#table-code">Copy HTML to Clipboard</button>
			</div>
 
			<script>
				//Hide the copy to clipboard button for Safari
				var uagent = navigator.userAgent.toLowerCase();
				if(/safari/.test(uagent) && !/chrome/.test(uagent))
				{
					document.write("<style type='text/css'>.options-button, .options-buttons-area {display: none !important;}</style>");	
				}
			</script>  
			  
			  
			<script>
				//Copy to Clipboard script by Craig Buckler @craigbuckler
				  (function () {
				'use strict';
				document.body.addEventListener('click', copy, true);
				function copy(e) {
					var t = e.target, c = t.dataset.copytarget, inp = c ? document.querySelector(c) : null;
					if (inp && inp.select) {
						inp.select();
						try {
							document.execCommand('copy');
							inp.blur();
							t.classList.add('copied');
							setTimeout(function () {
								t.classList.remove('copied');
							}, 1500);
						} catch (err) {
							alert('please press Ctrl/Cmd+C to copy');
						}
					}
				}
			}());
			 </script>


			<div class="ad-unit">
				<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Tableizer Responsive - Home Page -->
				<ins class="adsbygoogle"
					 style="display:block"
					 data-ad-client="ca-pub-7932050359867089"
					 data-ad-slot="5937817505"
					 data-ad-format="auto"></ins>
				<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
			
			<p class="site-instruction">This is what your table looks like:</p>

			<div class="samplearea">
	
				<style type="text/css">table.tableizer-table {border: 1px solid #CCC; font-family:; font-size: ;} .tableizer-table td {padding: 4px; margin: 3px; border: 1px solid #ccc;} .tableizer-table th {background-color: #; color: #FFF; font-weight: bold;} </style><table class="tableizer-table">
	<thead><tr class="tableizer-firstrow"><th></th></tr>
</tbody></table>	
			</div>
			
		<div class="ad-unit">
			<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- Tableizer Responsive - Home Page -->
			<ins class="adsbygoogle"
				 style="display:block"
				 data-ad-client="ca-pub-7932050359867089"
				 data-ad-slot="5937817505"
				 data-ad-format="auto"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
		</div>

			<div id="footer">
		<p>Like Tableizer? Help save kids' lives with a donation to <a href="https://shop.stjude.org/GiftCatalog/donation.do?cID=14262&pID=24671" rel="nofollow">St. Jude's Children's Research Hospital</a>.</p>
		
		<p>Tableizer! by <a href="https://twitter.com/dannysanchez">Danny Sanchez</a>, 2017.</p>
		
		<p><a href="faq.php">Read the Tableizer FAQ</a> or <a href="contact.php">contact me here</a>.</p>
	</div>
	<!-- GOOGLE ANALYTICS -->	
	<script type="text/javascript">
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
		try {
		var pageTracker = _gat._getTracker("UA-611050-3");
		pageTracker._trackPageview();
		} catch(err) {}
	</script>
	<!-- END GOOGLE ANALYTICS -->
	</div>
	<!-- COLOR PICKER SCRIPT -->
	<script src="http://192.168.133.177/page2/Tableize/jscolor.min.js"></script>
</body>
</html>