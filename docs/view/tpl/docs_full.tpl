<!doctype html>
<html lang="en"><head>
        <meta charset="utf-8">
        <title>Hubzilla Documentation</title>
        <!-- Mobile viewport optimized -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <!-- Le styles -->
        <link href="/addon/docs/view/css/bootswatch/Cosmo/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/docs/view/css/jquery.tocify.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/docs/view/css/jquery-ui.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/docs/view/css/prettify.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/docs/view/css/styles.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/docs/view/css/rainbow/themes/tomorrow-night.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/addon/docs/view/css/rainbowlines/theme.css" rel="stylesheet" type="text/css" media="screen">

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
                        <p>We've tried very hard to ensure that Hubzilla will run on commodity
                        hosting platforms - such as those used to host Wordpress blogs and Drupal 
                        websites. It will run on most any Linux VPS system. Windows LAMP platforms
                        such as XAMPP and WAMP are not officially supported at this time - however 
                        we welcome patches if you manage to get it working. 

                        Be aware that the Hubzilla is more than a simple web application. It is a 
                        complex communications system which more closely resembles an email server 
                        than a web server. For reliability and performance, messages are delivered in
                        the background and are queued for later delivery when sites are down. This
                        kind of functionality requires a bit more of the host system than the typical
                        blog. Not every PHP/MySQL hosting provider will be able to support the 
                        Hubzilla. Many will - but please review the requirements and confirm these 
                        with your hosting provider prior to installation. (And preferably before 
                        entering into a long-term contract.)

                        If you encounter installation issues, please let us know via the Github issue 
                        tracker (https://github.com/redmatrix/hubzilla/issues). Please be as clear as you 
                        can about your operating environment and provide as much detail as possible
                        about any error messages you may see, so that we can prevent it from happening 
                        in the future. Due to the large variety of operating systems and PHP platforms 
                        in existence we may have only limited ability to debug your PHP installation or 
                        acquire any missing modules - but we will do our best to solve any general code 
                        issues.</p>
                        <h3>Installation</h3>
                        <p></p>
                        <h4>Manual installation on a Debian-based system</h4>
                        <ol>
                            <li>
                                <h5>Install required packages</h5>
                                <pre> 
                                    <code data-language="shell">
sudo apt-get install apache2 php5 php5-cli php5-json php5-gd php5-sqlite curl libcurl3 libcurl3-dev php5-curl libapache2-mod-php5 php5-mysql php5-intl php5-mcrypt php5-imagick imagemagick git mailutils sendmail git                                        
                                    </code>
                                </pre>
                            </li>
                            <li>
                                <h5>Clone the Hubzilla core repo to your web root</h5>
                                <pre> 
                                    <code data-language="shell">
cd /var/www/
git clone https://github.com/redmatrix/hubzilla.git mywebsite
                                    </code>
                                </pre>
                            </li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ol>
                        <h4>Automated installation via shell script</h4>
                        <p></p>
                        <h4>Deploy using OpenShift</h4>
                        <p></p>
                        <h4>Install as a YunoHost app</h4>
                        <p></p>
                        <h3>FAQ</h3>
                        <p>These are questions frequently asked by hub admins.</p>
                        <div class="faq">
                            <p class="faq-question">I want to run a social network as an alternative to Facebook/Google/Twitter/Instagram/..., but Hubzilla is too advanced/complicated for my hub members. Is there a way to make it easier to use, preferably by crippling/removing all the features that make Hubzilla unique and revolutionary?</p>
                            <p>Sure you can! At installation time, you can choose to run an UNO configured hub instead of enabling the advanced features.</p>
                        </div>
                        <div class="faq">
                            <p class="faq-question">Is there a way to have multiple administrators?</p>
                            <p>Yes, but it's a bit messy at the moment as it is not yet exposed in the UI.  To make an account an administrative account, one needs to add 4096 to the account_roles entry in the account table of the database.  Likewise, to remove administrative permissions, one must subtract 4096 from the account roles.</p> 
                        </div>
                        <div class="faq">
                            <p class="faq-question">What do the different directory mode settings mean?</p>
                            <pre> 
                                <code data-language="javascript">
// Configure how we communicate with directory servers.
// DIRECTORY_MODE_NORMAL     = directory client, we will find a directory (all of your member's queries will be directed elsewhere)
// DIRECTORY_MODE_SECONDARY  = caching directory or mirror (keeps in sync with realm primary [adds significant cron execution time])
// DIRECTORY_MODE_PRIMARY    = main directory server (you do not want this unless you are operating your own realm. one per realm.)
// DIRECTORY_MODE_STANDALONE = "off the grid" or private directory services (only local site members in directory)

                                </code>
                            </pre>
                            <ul>
                                <li>The default is NORMAL. This off-loads most directory services to a different server. The server used is the config:system/directory_server. This setting MAY be updated by the code to one of the project secondaries if the current server is unreachable. You should either be in control of this other server, or should trust it to use this setting.</li>
                                <li>SECONDARY. This allows your local site to act as a directory server without exposing your member's queries to another server. It requires extra processing time during the cron polling, and is not recommended to be run on a shared web host.</li>
                                <li>PRIMARY. This allows you to run a completely separate 'Network' of directory servers with your own Realm. By default, all servers are on the RED_GLOBAL realm unless the config:system/directory_realm setting is overridden. Do not use this unless you have your own directory_realm.</li>
                                <li>STANDALONE. This is like primary, except it's a 'Network' all on it's own without talking to any other servers. Use this if you have only one server and want to be segregated from the Red#Matrix directory listings.</li>
                            </ul>
                        </div>
                        <div class="faq">
                            <p class="faq-question"></p>
                            <p></p> 
                        </div>
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
        <script src="/addon/docs/view/js/rainbow/rainbow.min.js"></script>
        <script src="/addon/docs/view/js/rainbow/language/generic.js"></script>
        <script src="/addon/docs/view/js/rainbow/language/html.js"></script>
        <script src="/addon/docs/view/js/rainbow/language/css.js"></script>
        <script src="/addon/docs/view/js/rainbow/language/javascript.js"></script>
        <script src="/addon/docs/view/js/rainbowlines/rainbow.linenumbers.js"></script>
        <script src="/addon/docs/view/js/jquery.min.js"></script>
        <script src="/addon/docs/view/js/jquery-ui.min.js"></script>
        <script src="/addon/docs/view/js/bootstrap.min.js"></script>
        <script src="/addon/docs/view/js/jquery.tocify.min.js"></script>
        <script src="/addon/docs/view/js/prettify.js"></script>

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