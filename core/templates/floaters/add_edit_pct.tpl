{literal}    
    <script type="text/javascript"> 
        $(document).ready(function() {
            $('#addPct').ajaxForm(function() { 
                floaterClose();
                hook_chgPct();
            });
             $('#floater_innerwrap').tabs({ selected: 0 });
        }); 
    </script>
{/literal}

<div id="floater_innerwrap">
    
    <div id="floater_handle">
        <span id="floater_title">{if $id}{$kga.lang.edit}: {$kga.lang.pct}{else}{$kga.lang.new_pct}{/if}</span>
        <div class="right">
            <a href="#" class="close" onClick="floaterClose();">{$kga.lang.close}</a>
        </div>       
    </div>
    
    <div class="menuBackground">

      <ul class="menu tabSelection">
          <li class="tab norm"><a href="#general">
                      <span class="aa">&nbsp;</span>
                      <span class="bb">{$kga.lang.general}</span>
                      <span class="cc">&nbsp;</span>
                      </a></li>
{if $sel_grp_IDs|@count gt 1}
          <li class="tab norm"><a href="#groups">
                      <span class="aa">&nbsp;</span>
                      <span class="bb">{$kga.lang.groups}</span>
                      <span class="cc">&nbsp;</span>
                      </a></li>
{/if}
          <li class="tab norm"><a href="#comment">
                      <span class="aa">&nbsp;</span>
                      <span class="bb">{$kga.lang.comment}</span>
                      <span class="cc">&nbsp;</span>
                      </a></li>
      </ul>
    </div>

    <form id="addPct" action="processor.php" method="post"> 
      <input name="pct_filter"  type="hidden" value="0" />
      <input name="axAction"    type="hidden" value="add_edit_KndPctEvt" />   
      <input name="axValue"     type="hidden" value="pct" />   
      <input name="id"          type="hidden" value="{$id}" />   


    <div id="floater_tabs" class="floater_content">
    
            <fieldset id ="general">

                <ul>
                
                    <li>
                        <label for="pct_name" >{$kga.lang.pct}:</label>
                        <input type="text" name="pct_name" id="focus" value="{$pct_name}" />
                    </li>

                    <li>
                        <label for="pct_kndID" >{$kga.lang.knd}:</label>
                        <select class="formfield" name="pct_kndID">
                            {html_options values=$sel_knd_IDs output=$sel_knd_names selected=$knd_selection}
                        </select>
                    </li>
                    
                    <li>
                         <label for="pct_visible">{$kga.lang.visibility}:</label>
                         <input name="pct_visible" type="checkbox" value='1' {if $pct_visible || !$id}checked="checked"{/if} />
                    </li>

                    <li>
                        <label for="pct_default_rate" >{$kga.lang.default_rate}:</label>
                        <input type="text" name="pct_default_rate" value="{$pct_default_rate|replace:'.':$kga.conf.decimalSeparator}" />
                    </li>

                    <li>
                        <label for="pct_my_rate" >{$kga.lang.my_rate}:</label>
                        <input type="text" name="pct_my_rate" value="{$pct_my_rate|replace:'.':$kga.conf.decimalSeparator}" />
                    </li>

                    <li>
                         <label for="pct_budget">{$kga.lang.budget}:</label>
                         <input type='text' name='pct_budget' cols='30' rows='5' value="{$pct_budget}"/>
                    </li>
                  </ul>
            </fieldset>
                    
{if $sel_grp_IDs|@count gt 1}
            <fieldset id="groups">
              <ul>
                    <li>
                        <label for="pct_grp" >{$kga.lang.groups}:</label>
                        <select class="formfield" name="pct_grp[]" multiple size='5' style="width:255px">
                            {html_options values=$sel_grp_IDs output=$sel_grp_names selected=$grp_selection}
                        </select>
                    </li>
                  </ul>
            </fieldset>
{else}
            <input name="pct_grp[]" type="hidden" value="{$grp_selection.0}" />
{/if}
            
            <fieldset id="comment">
              <ul>
                    <li>
                         <label for="pct_comment">{$kga.lang.comment}:</label>
                         <textarea class='comment' name='pct_comment' cols='30' rows='5' >{$pct_comment}</textarea>
                    </li>
              </ul>
            </fieldset>
        
    </div>
                                             
                <div id="formbuttons">
                    <input class='btn_norm' type='button' value='{$kga.lang.cancel}' onClick='floaterClose(); return false;' />
                    <input class='btn_ok' type='submit' value='{$kga.lang.submit}' />
                </div>
        </form>
</div>
