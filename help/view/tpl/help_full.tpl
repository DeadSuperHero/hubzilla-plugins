<!doctype html>
<html lang="en"><head>
        <meta charset="utf-8">
        <title>Hubzilla Documentation</title>
        <!-- Mobile viewport optimized -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <!-- Le styles -->
        <link href="/addon/help/view/css/bootswatch/Cosmo/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/help/view/css/jquery.tocify.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/help/view/css/jquery-ui.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/help/view/css/prettify.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/help/view/css/styles.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/help/view/css/rainbow/themes/tomorrow-night.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/help/view/css/rainbowlines/theme.css" rel="stylesheet" type="text/css" media="screen">

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom:120px;">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" onclick="
                        $('body,html').animate({
                            scrollTop: 0
                        }, 150);
                        return false;
                   "><span style="font-weight: bold;">Hubzilla </span><span style="font-weight: lighter;">Documentation</span></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-role="navigation">
                <ul class="nav navbar-nav">
                    <li><a class="page-scroll" href="#member">Members</a></li>
                    <li><a class="page-scroll" href="#admin">Admins</a></li>
                    <li><a class="page-scroll" href="#developer">Developers</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>


        <div class="container-fluid" style="margin-top:50px;">
            <div class="row">
                <div class="tocify col-sm-3 col-md-3">
                    <div id="toc">
                    </div><!--/.well -->
                </div><!--/span-->
                <div class="col-sm-9 col-md-9">
                    <div class="jumbotron">
                        <h1><span style="font-weight: bold;">Hubzilla </span><span style="font-weight: lighter;">Documentation</span></h1>
                        <h2 class="tocIgnore">Build a community of connected websites</h2>
                        <p>Hubzilla is a powerful platform for creating interconnected websites featuring a decentralized identity, communications, and permissions framework built using common webserver technology. The Hubzilla project code is hosted on <a class="projectLinks" href="http://github.com/redmatrix/hubzilla/" target="_blank">Github</a> and is available for use under the <a class="projectLinks" href="https://github.com/redmatrix/hubzilla/blob/master/LICENSE" target="_blank">MIT software license</a>.  You can report bugs and discuss features on the <a href="https://github.com/redmatrix/hubzilla/issues" target="_blank">GitHub issues page</a>.</p>
                    </div>
                    <section id="general">
                        <h2 class="underline">Concepts and Terminology</h2>
                        <p>Hubzilla is an advanced platform for decentralized publishing with concepts and terminology that 
                        may be new to you. Let's start off with some definitions so that the rest of the documentation makes
                        sense.</p>
                        <h3>Hub</h3>
                        <p class="well"> Hubs are the servers that communicate with one another to propagate information across the network, or "grid". </p>
                        <p>There is no central hub or single point of failure. Hubs are very scalable and suitable for communities of any size, from a small family on a shared host to a large group of people on a dedicated server. </p>
                        <h3>Channel</h3>
                        <p class="well">  A channel is a fundamental (id)entity on the grid.</p>
                        <p>A channel can represent many different things: a person, a blog, or a forum to name a few. Channels can make connections with other channels to share information with highly detailed permissions. Channels are addressed using a familiar channel@hub.domain format. </p>
                        <h3>Grid</h3>
                        <p>The grid is what we call a network of hubs that communicate with one another. The admin has control over how the hub does or does not connect to the global grid, allowing communities to be as open or closed as they desire.</p>
                        <h3>Decentralization</h3>
                        <p class="well">A decentralized network is one comprised of nodes that do not rely on a central authority. </p>
                        <p>Like the internet itself, the network of hubs is completely decentralized. Hubs communicate directly with one another using standard secure HTTP, encoding data with additional encryption according to the <a href="#zot">Zot protocol</a>, and the network is robust against </p>
                        <h3>Zot</h3>
                        <p class="well">Zot is a JSON-based web framework for implementing secure decentralised communications and services. </p>
                        <p>More information about the <a href="#zot">Zot protocol</a> is in the Developer section.</p>
                        <h3>Federation</h3>
                        <p>The decentralized Hubzilla network itself is technically a federation. While each hub can function completely independently, in order for hubs to communicate on the grid, they must employ the Zot protocol and a standard API.</p>
                        <p>Typically in the context of social networks, <i>federation</i> refers to a broader interoperability between servers running entirely different platforms, such as Friendica, Diaspora, and GNUsocial. Currently Hubzilla unofficially supports various levels of interoperability with each of these networks; however, this is accomplished not by implementing a mutually accepted protocol but by Hubzilla implementing each of the various networks' protocols. Whether or not this constitutes a genuine federation is a topic for debate.</p>
                    </section>
                    <br><br>
                    
                    <section id="admin">
                        <h2 class="underline">Administrators</h2>
                        <p></p>
                        <h3>Prerequisites</h3>
                        <p></p>
                        <h3>Installation</h3>
                        <p></p>
                        <h3>Installation</h3>
                        <p></p>
                        <h3>FAQ</h3>
                        <p></p>
                    </section>
                    <br><br>
                    
                    <section id="developer">
                        <h2 class="underline">Developers</h2>
                        <h3 id="zot">Zot</h3>
                        <p>Zot is a JSON-based web framework for implementing secure decentralised communications and services. It differs from many other communication protocols by building communications on top of a decentralised identity and authentication framework. The authentication component is similar to OpenID conceptually but is insulated from DNS-based identities. Where possible remote authentication is silent and invisible. This provides a mechanism for internet scale distributed access control which is unobtrusive.</p>
                    </section>
                    <br><br>
                    
                    <section id="member">
                        <h2 class="underline">Members</h2>
                    </section>
                </div>
            </div><!--/row-->

        </div><!--/.fluid-container-->

        <!-- Le javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="/addon/help/view/js/rainbow/rainbow.min.js"></script>
        <script src="/addon/help/view/js/rainbow/language/generic.js"></script>
        <script src="/addon/help/view/js/rainbow/language/html.js"></script>
        <script src="/addon/help/view/js/rainbow/language/css.js"></script>
        <script src="/addon/help/view/js/rainbow/language/javascript.js"></script>
        <script src="/addon/help/view/js/rainbowlines/rainbow.linenumbers.js"></script>
        <script src="/addon/help/view/js/jquery.min.js"></script>
        <script src="/addon/help/view/js/jquery-ui.min.js"></script>
        <script src="/addon/help/view/js/bootstrap.min.js"></script>
        <script src="/addon/help/view/js/jquery.tocify.min.js"></script>
        <script src="/addon/help/view/js/prettify.js"></script>

        <script>
                    $(function () {

                        $("#toc").tocify({selectors: "h2, h3, h4", scrollTo: 60, highlightOffset: 60, extendPage: true, ignoreSelector: ".tocIgnore"});

                        prettyPrint();

                        $(".optionName").popover({trigger: "hover", container: "body"});

                        $("a[href='#']").click(function (event) {

                            event.preventDefault();

                        });

                        Rainbow.color();
                    });
        </script>

    </body>
</html>