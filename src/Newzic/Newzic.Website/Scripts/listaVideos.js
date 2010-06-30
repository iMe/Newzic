var removerVideos = [];
 var str = "";
 function iniciaHandlers2 (i) {
                
                $('#removeVideo' + i).click (function () {
                   $('#linhaVideo'+ i).fadeOut ();
                   removerVideos.push (i);
                   
                });
            }

             function mandaString () {
                var i;
                
                for (i = 0; i < removerVideos.length; i++) {
                    str += removerVideos[i] + ';';
                }
                $('#stringListaVideo')[0].value = str;
                alert (str);
            }

            function iniciaHandlers() {
                var i = 0;
                var contador = <%=Html.Encode (Model.Videos.Count) %>;
                $('#botaoSubmit').click (mandaString);
                for (i = 0; i < contador; i++)
                    iniciaHandlers2(i);
            }

            $(document).ready (iniciaHandlers);
