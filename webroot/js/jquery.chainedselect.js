jQuery.fn.chainSelect = function(target, url, settings) 
{
  return this.each( function()
  {
        $(this).click( function( ) 
        {
                settings = jQuery.extend(
                {
                        after : null,
                        before : null,
                        usePost : false,
                        defaultValue : null,
                        parameters : {'_id' : $(this).attr('id'), '_name' : $(this).attr('name'), 'action': 'get_cat'}
                } , settings);
                
                 $('#sec').html('');
                 
                settings.parameters._value =  $(this).val();
                           var str='';

                if (settings.before != null) 
                {
                        settings.before( target );
                }

                ajaxCallback = function(data, textStatus) 
                {
                        $(target).html("<option disabled='true'>Seçin...</option>");//evvelkileri sil
                        
                        data = eval(data);//get json array
                          
                                  var str2='';
                        
                        if (data[0] && (typeof data[0].name !== "undefined")) {
                          
                       //   alert(data.length);
                       
                         $(target).parent().css({'display':'block', 'height':'60px'});
                          
                           if (data[0] && (data[0]['fatty']=='fatty' || data[0]['amount']=='amount' || data[0]['diri']=='diri' || data[0]['cins']=='cins')) {
                                  
                                    for (i=0;i<data[0]["pro"].length; i++) {
                                        str2=str2+'<option value="'+data[0]['pro'][i]['id']+'">'+data[0]['pro'][i]['name']+'</option>';
                                                        
                                    }
                                   
                            }
                           
                           
                            for (i = 0; i < data.length; i++)
                            {
                                for ( key in data[i] )
                                {     
                                              
                                              if(key=='name'){
                                                
                                                $(target).get(0).add(new Option(data[i]['name'],data[i]['id']), document.all ? i : null);
                                              
                                              }
                                              
                                }
                            }
                            
                            console.log(data);
                        
                        }
                        
                        else {
                          
                          console.log(data);
                          
                          if (data[0] && typeof data[0].acil==="undefined") {
                            
                            $('#subcat2').parent().css('display','none');
                            
                          }
                          if (data[0] && (data[0]['fatty']=='fatty' || data[0]['amount']=='amount' || data[0]['diri']=='diri' || data[0]['cins']=='cins')) {
                                 
                                  
                                    for (i=0;i<data[0]["pro"].length; i++) {
                                        str2=str2+'<option value="'+data[0]['pro'][i]['id']+'">'+data[0]['pro'][i]['name']+'</option>';
                                                        
                                    }
                                   
                            }
                                  //    alert(data.length);
                                      
                             for (i = 0; i < data.length-2; i++)//iterate over all options
                              {
                                  for ( key in data[i] )//get key => value
                                  {     
                                        $(target).get(0).add(new Option(data[i][key][1],data[i][key][0]), document.all ? i : null);
                                                
                                  }
                              }
                          
                          
                          
                        }
                       
              if (data[0] && (data[0]['amount']=='amount' || (typeof data[0]["par"]!=='undefined' && data[0]["par"][0]["amount"]))) {
                  
                  str3="";
             
                    if (data[0]["vahid"].length>0) {
                        
                      var str3="<select id='vahid' class='form-control input-lg' style='margin-top:15px'>";
                  
                      for (i=0;i<data[0]["vahid"].length; i++) {
                                str3=str3+'<option value="'+data[0]['vahid'][i]['id']+'">'+data[0]['vahid'][i]['name']+'</option>';
                                                
                      }
                        
                    }
             
              str3=str3+"</select>";
                  str=str+'<div class="form-group"><input type="text" class="form-control input-lg" id="amount" placeholder="Sayi">'+str3+'</div>';
                }
                
               
                if (data[0] && (data[0]['diri']=='diri' || (typeof data[0]["par"]!=='undefined' && data[0]["par"][0]["diri"]))) {
                   str=str+'<div class="form-group"><input type="text" class="form-control input-lg" id="diri" placeholder="Diri çəkisi"></div>';
                }
                if (data[0] && (data[0]['cins']=='cins' || (typeof data[0]["par"]!=='undefined' && data[0]["par"][0]["cins"]))) {
                  str+='<div class="form-group"><input type="text" class="form-control input-lg" id="cins" placeholder="Cinsi"></div>';
                }
                if (data[0] && (data[0]['fatty']=='fatty' || (typeof data[0]["par"]!=='undefined' && data[0]["par"][0]["fatty"]))) {
                  str+='<div class="form-group"><input type="text" class="form-control input-lg" id="fatty" placeholder="Kokluyu"></div>';
                }
                if (data[0] && (data[0]['age']=='age' || (typeof data[0]["par"]!=='undefined' && data[0]["par"][0]["age"]))) {
                  str+='<div class="form-group"><input type="text" class="form-control input-lg" id="age" placeholder="Yasi"></div>';
                }
                
                //  alert(data[0]["0"].length);
                  
                  
                  
                  $('#doldur').html(str);
                 
                  if (str2!="") {
                   
                     $('#sec').html('<select class="form-control" name="pro" id="pro"><option disabled="true">Seçin...</option>'+str2+'</select>');
                                   
                  }
                  
                
                      //   $('#doldur').html(data[0]['amount']);
                 
                   if (settings.defaultValue != null)
                        {
                                $(target).val(settings.defaultValue);//select default value
                        } else
                        {
                                $("option:first", target).attr( "selected", "selected" );//select first option
//alert('hello');
                        }

                        if (settings.after != null) 
                        {
                                settings.after(target);
                        }

                        $(target).change();//call next chain
                };

                if (settings.usePost == true)
                {
                        $.post( url, settings.parameters, ajaxCallback );
                } else
                {
                        $.get( url, settings.parameters, ajaxCallback );
                }
        });
  });
};