<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>${content?.title}</title>
    <meta content="subpage" name="layout" />
    <g:javascript library="scriptaculous" />
    <g:javascript library="diff_match_patch" />

    <script type="text/javascript">
        var dmp = new diff_match_patch();

        function showDiff() {


            var text1 = $("text1").innerHTML
            var text2 = $("text2").innerHTML

            var d = dmp.diff_main(text1, text2);
            dmp.diff_cleanupSemantic(d);
            var ds = dmp.diff_prettyHtml(d);

            $('diffOutputDiv').innerHTML = ds;

            Effect.Appear('diffOutputDiv')
        }

        function getAjaxOptions() {
            return {asynchronous:true,
                evalScripts:true,
                parameters:Form.serialize($('wikiEditForm')),
                method:"POST"
            }
        }
    </script>
</head>
<body>
    <div id="contentPane">
        <g:render template="viewActions" model="[content:content]" />
        <div id="editPane" style="margin-top:10px;">
            <wiki:text key="${content?.title}">
                ${content?.body}
            </wiki:text>
        </div>

    </div>
</body>
</html>