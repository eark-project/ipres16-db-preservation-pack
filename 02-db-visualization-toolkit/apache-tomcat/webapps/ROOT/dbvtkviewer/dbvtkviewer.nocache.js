function dbvtkviewer(){var S='bootstrap',T='begin',U='gwt.codesvr.dbvtkviewer=',V='gwt.codesvr=',W='dbvtkviewer',X='startup',Y='DUMMY',Z=0,$=1,_='iframe',ab='javascript:""',bb='position:absolute; width:0; height:0; border:none; left: -1000px;',cb=' top: -1000px;',db='CSS1Compat',eb='<!doctype html>',fb='',gb='<html><head><\/head><body><\/body><\/html>',hb='undefined',ib='DOMContentLoaded',jb=50,kb='Chrome',lb='eval("',mb='");',nb='script',ob='javascript',pb='moduleStartup',qb='moduleRequested',rb='Failed to load ',sb='head',tb='meta',ub='name',vb='dbvtkviewer::',wb='::',xb='gwt:property',yb='content',zb='=',Ab='gwt:onPropertyErrorFn',Bb='Bad handler "',Cb='" for "gwt:onPropertyErrorFn"',Db='gwt:onLoadErrorFn',Eb='" for "gwt:onLoadErrorFn"',Fb='#',Gb='?',Hb='/',Ib='img',Jb='clear.cache.gif',Kb='baseUrl',Lb='dbvtkviewer.nocache.js',Mb='base',Nb='//',Ob='locale',Pb='en',Qb='locale=',Rb=7,Sb='&',Tb='_',Ub='__gwt_Locale',Vb='Unexpected exception in locale detection, using default: ',Wb=2,Xb='supportsDateTimeInput',Yb='input',Zb='type',$b='datetime',_b='text',ac='y',bc='n',cc='user.agent',dc='webkit',ec='safari',fc='msie',gc=10,hc=11,ic='ie10',jc=9,kc='ie9',lc=8,mc='ie8',nc='gecko',oc='gecko1_8',pc=3,qc=4,rc='selectingPermutation',sc='dbvtkviewer.devmode.js',tc='default',uc='1071401C3CC7D4793168651A2F000652',vc=':1',wc='210D96D588B45EDEEEC31023813FC1FF',xc='33BED2F094D4C5A2691A1A91ED72C039',yc='35A1CC20DC1948024C47FC86D8F22A42',zc='4B0F8B15F1EFC64505E2ADC98E6131DC',Ac='pt_PT',Bc='648E4028D9AC7707373DF508291110ED',Cc='6E010CA188C4962A2A72E0087BD08A2D',Dc='78DE587EEA1477E5DD3C5904D7147CBC',Ec='7DD985E51D69A165B9282B586DA2BD7F',Fc='94593F30538C707A759015FA0CF8651C',Gc='A397AFE8252D28095A45F1FCB5364664',Hc='A3D61C0521886A57CED713D9121D9711',Ic='B389B5CE46BB45BE7521F58B85701AED',Jc='C7DD623B87D06C3B661383FFB58A182D',Kc='D27EFEFB8893958EB95F3715705925C4',Lc='D494EF84B52D8AA66640449F4E9BBA50',Mc='D6BFF94B656402E512E7D83D04BC0EB9',Nc='EB5F9FE1E7A6C65996FD0CD7F8148A5D',Oc=':',Pc='.cache.js',Qc='link',Rc='rel',Sc='stylesheet',Tc='href',Uc='loadExternalRefs',Vc='timebox.css',Wc='fontawesome/css/font-awesome.min.css',Xc='roda_main.css',Yc='main.css',Zc='../api/v1/theme?resource_id=theme.css',$c='print.css',_c='end',ad='http:',bd='file:',cd='_gwt_dummy_',dd='__gwtDevModeHook:dbvtkviewer',ed='Ignoring non-whitelisted Dev Mode URL: ',fd=':moduleBase';var s=window;var t=document;v(S,T);function u(){var a=s.location.search;return a.indexOf(U)!=-1||a.indexOf(V)!=-1}
function v(a,b){if(s.__gwtStatsEvent){s.__gwtStatsEvent({moduleName:W,sessionId:s.__gwtStatsSessionId,subSystem:X,evtGroup:a,millis:(new Date).getTime(),type:b})}}
dbvtkviewer.__sendStats=v;dbvtkviewer.__moduleName=W;dbvtkviewer.__errFn=null;dbvtkviewer.__moduleBase=Y;dbvtkviewer.__softPermutationId=Z;dbvtkviewer.__computePropValue=null;dbvtkviewer.__getPropMap=null;dbvtkviewer.__installRunAsyncCode=function(){};dbvtkviewer.__gwtStartLoadingFragment=function(){return null};dbvtkviewer.__gwt_isKnownPropertyValue=function(){return false};dbvtkviewer.__gwt_getMetaProperty=function(){return null};var w=null;var A=s.__gwt_activeModules=s.__gwt_activeModules||{};A[W]={moduleName:W};dbvtkviewer.__moduleStartupDone=function(e){var f=A[W].bindings;A[W].bindings=function(){var a=f?f():{};var b=e[dbvtkviewer.__softPermutationId];for(var c=Z;c<b.length;c++){var d=b[c];a[d[Z]]=d[$]}return a}};var B;function C(){D();return B}
function D(){if(B){return}var a=t.createElement(_);a.src=ab;a.id=W;a.style.cssText=bb+cb;a.tabIndex=-1;t.body.appendChild(a);B=a.contentDocument;if(!B){B=a.contentWindow.document}B.open();var b=document.compatMode==db?eb:fb;B.write(b+gb);B.close()}
function F(k){function l(a){function b(){if(typeof t.readyState==hb){return typeof t.body!=hb&&t.body!=null}return /loaded|complete/.test(t.readyState)}
var c=b();if(c){a();return}function d(){if(!c){c=true;a();if(t.removeEventListener){t.removeEventListener(ib,d,false)}if(e){clearInterval(e)}}}
if(t.addEventListener){t.addEventListener(ib,d,false)}var e=setInterval(function(){if(b()){d()}},jb)}
function m(c){function d(a,b){a.removeChild(b)}
var e=C();var f=e.body;var g;if(navigator.userAgent.indexOf(kb)>-1&&window.JSON){var h=e.createDocumentFragment();h.appendChild(e.createTextNode(lb));for(var i=Z;i<c.length;i++){var j=window.JSON.stringify(c[i]);h.appendChild(e.createTextNode(j.substring($,j.length-$)))}h.appendChild(e.createTextNode(mb));g=e.createElement(nb);g.language=ob;g.appendChild(h);f.appendChild(g);d(f,g)}else{for(var i=Z;i<c.length;i++){g=e.createElement(nb);g.language=ob;g.text=c[i];f.appendChild(g);d(f,g)}}}
dbvtkviewer.onScriptDownloaded=function(a){l(function(){m(a)})};v(pb,qb);var n=t.createElement(nb);n.src=k;if(dbvtkviewer.__errFn){n.onerror=function(){dbvtkviewer.__errFn(W,new Error(rb+code))}}t.getElementsByTagName(sb)[Z].appendChild(n)}
dbvtkviewer.__startLoadingFragment=function(a){return I(a)};dbvtkviewer.__installRunAsyncCode=function(a){var b=C();var c=b.body;var d=b.createElement(nb);d.language=ob;d.text=a;c.appendChild(d);c.removeChild(d)};function G(){var c={};var d;var e;var f=t.getElementsByTagName(tb);for(var g=Z,h=f.length;g<h;++g){var i=f[g],j=i.getAttribute(ub),k;if(j){j=j.replace(vb,fb);if(j.indexOf(wb)>=Z){continue}if(j==xb){k=i.getAttribute(yb);if(k){var l,m=k.indexOf(zb);if(m>=Z){j=k.substring(Z,m);l=k.substring(m+$)}else{j=k;l=fb}c[j]=l}}else if(j==Ab){k=i.getAttribute(yb);if(k){try{d=eval(k)}catch(a){alert(Bb+k+Cb)}}}else if(j==Db){k=i.getAttribute(yb);if(k){try{e=eval(k)}catch(a){alert(Bb+k+Eb)}}}}}__gwt_getMetaProperty=function(a){var b=c[a];return b==null?null:b};w=d;dbvtkviewer.__errFn=e}
function H(){function e(a){var b=a.lastIndexOf(Fb);if(b==-1){b=a.length}var c=a.indexOf(Gb);if(c==-1){c=a.length}var d=a.lastIndexOf(Hb,Math.min(c,b));return d>=Z?a.substring(Z,d+$):fb}
function f(a){if(a.match(/^\w+:\/\//)){}else{var b=t.createElement(Ib);b.src=a+Jb;a=e(b.src)}return a}
function g(){var a=__gwt_getMetaProperty(Kb);if(a!=null){return a}return fb}
function h(){var a=t.getElementsByTagName(nb);for(var b=Z;b<a.length;++b){if(a[b].src.indexOf(Lb)!=-1){return e(a[b].src)}}return fb}
function i(){var a=t.getElementsByTagName(Mb);if(a.length>Z){return a[a.length-$].href}return fb}
function j(){var a=t.location;return a.href==a.protocol+Nb+a.host+a.pathname+a.search+a.hash}
var k=g();if(k==fb){k=h()}if(k==fb){k=i()}if(k==fb&&j()){k=e(t.location.href)}k=f(k);return k}
function I(a){if(a.match(/^\//)){return a}if(a.match(/^[a-zA-Z]+:\/\//)){return a}return dbvtkviewer.__moduleBase+a}
function J(){var k=[];var l=Z;function m(a,b){var c=k;for(var d=Z,e=a.length-$;d<e;++d){c=c[a[d]]||(c[a[d]]=[])}c[a[e]]=b}
var n=[];var o=[];function p(a){var b=o[a](),c=n[a];if(b in c){return b}var d=[];for(var e in c){d[c[e]]=e}if(w){w(a,d,b)}throw null}
o[Ob]=function(){var b=null;var c=Pb;try{if(!b){var d=location.search;var e=d.indexOf(Qb);if(e>=Z){var f=d.substring(e+Rb);var g=d.indexOf(Sb,e);if(g<Z){g=d.length}b=d.substring(e+Rb,g)}}if(!b){b=__gwt_getMetaProperty(Ob)}if(!b){var h=navigator.browserLanguage?navigator.browserLanguage:navigator.language;if(h){var i=h.split(/[-_]/);if(i.length>$){i[$]=i[$].toUpperCase()}b=i.join(Tb)}}if(!b){b=s[Ub]}if(b){c=b}while(b&&!__gwt_isKnownPropertyValue(Ob,b)){var j=b.lastIndexOf(Tb);if(j<Z){b=null;break}b=b.substring(Z,j)}}catch(a){alert(Vb+a)}s[Ub]=c;return b||Pb};n[Ob]={'default':Z,en:$,pt_PT:Wb};o[Xb]=function(){try{var b=document.createElement(Yb);b.setAttribute(Zb,$b);return b.type!==_b?ac:bc}catch(a){return bc}};n[Xb]={n:Z,y:$};o[cc]=function(){var a=navigator.userAgent.toLowerCase();var b=t.documentMode;if(function(){return a.indexOf(dc)!=-1}())return ec;if(function(){return a.indexOf(fc)!=-1&&(b>=gc&&b<hc)}())return ic;if(function(){return a.indexOf(fc)!=-1&&(b>=jc&&b<hc)}())return kc;if(function(){return a.indexOf(fc)!=-1&&(b>=lc&&b<hc)}())return mc;if(function(){return a.indexOf(nc)!=-1||b>=hc}())return oc;return fb};n[cc]={gecko1_8:Z,ie10:$,ie8:Wb,ie9:pc,safari:qc};__gwt_isKnownPropertyValue=function(a,b){return b in n[a]};dbvtkviewer.__getPropMap=function(){var a={};for(var b in n){if(n.hasOwnProperty(b)){a[b]=p(b)}}return a};dbvtkviewer.__computePropValue=p;s.__gwt_activeModules[W].bindings=dbvtkviewer.__getPropMap;v(S,rc);if(u()){return I(sc)}var q;try{m([tc,bc,mc],uc);m([tc,ac,mc],uc);m([tc,bc,mc],uc+vc);m([tc,ac,mc],uc+vc);m([tc,ac,ec],wc);m([Pb,bc,oc],xc);m([Pb,ac,oc],xc);m([Pb,bc,oc],xc+vc);m([Pb,ac,oc],xc+vc);m([tc,bc,kc],yc);m([tc,ac,kc],yc);m([tc,bc,kc],yc+vc);m([tc,ac,kc],yc+vc);m([tc,bc,ic],zc);m([tc,ac,ic],zc);m([tc,bc,ic],zc+vc);m([tc,ac,ic],zc+vc);m([Ac,bc,ec],Bc);m([Ac,bc,ic],Cc);m([Ac,ac,ic],Cc);m([Ac,bc,ic],Cc+vc);m([Ac,ac,ic],Cc+vc);m([Pb,bc,ec],Dc);m([Ac,ac,ec],Ec);m([tc,bc,ec],Fc);m([Pb,bc,kc],Gc);m([Pb,ac,kc],Gc);m([Pb,bc,kc],Gc+vc);m([Pb,ac,kc],Gc+vc);m([Ac,bc,mc],Hc);m([Ac,ac,mc],Hc);m([Ac,bc,mc],Hc+vc);m([Ac,ac,mc],Hc+vc);m([Ac,bc,kc],Ic);m([Ac,ac,kc],Ic);m([Ac,bc,kc],Ic+vc);m([Ac,ac,kc],Ic+vc);m([Pb,ac,ec],Jc);m([Pb,bc,mc],Kc);m([Pb,ac,mc],Kc);m([Pb,bc,mc],Kc+vc);m([Pb,ac,mc],Kc+vc);m([Pb,bc,ic],Lc);m([Pb,ac,ic],Lc);m([Pb,bc,ic],Lc+vc);m([Pb,ac,ic],Lc+vc);m([tc,bc,oc],Mc);m([tc,ac,oc],Mc);m([tc,bc,oc],Mc+vc);m([tc,ac,oc],Mc+vc);m([Ac,bc,oc],Nc);m([Ac,ac,oc],Nc);m([Ac,bc,oc],Nc+vc);m([Ac,ac,oc],Nc+vc);q=k[p(Ob)][p(Xb)][p(cc)];var r=q.indexOf(Oc);if(r!=-1){l=parseInt(q.substring(r+$),gc);q=q.substring(Z,r)}}catch(a){}dbvtkviewer.__softPermutationId=l;return I(q+Pc)}
function K(){if(!s.__gwt_stylesLoaded){s.__gwt_stylesLoaded={}}function c(a){if(!__gwt_stylesLoaded[a]){var b=t.createElement(Qc);b.setAttribute(Rc,Sc);b.setAttribute(Tc,I(a));t.getElementsByTagName(sb)[Z].appendChild(b);__gwt_stylesLoaded[a]=true}}
v(Uc,T);c(Vc);c(Wc);c(Xc);c(Yc);c(Zc);c($c);v(Uc,_c)}
G();dbvtkviewer.__moduleBase=H();A[W].moduleBase=dbvtkviewer.__moduleBase;var L=J();if(s){var M=!!(s.location.protocol==ad||s.location.protocol==bd);s.__gwt_activeModules[W].canRedirect=M;function N(){var b=cd;try{s.sessionStorage.setItem(b,b);s.sessionStorage.removeItem(b);return true}catch(a){return false}}
if(M&&N()){var O=dd;var P=s.sessionStorage[O];if(!/^http:\/\/(localhost|127\.0\.0\.1)(:\d+)?\/.*$/.test(P)){if(P&&(window.console&&console.log)){console.log(ed+P)}P=fb}if(P&&!s[O]){s[O]=true;s[O+fd]=H();var Q=t.createElement(nb);Q.src=P;var R=t.getElementsByTagName(sb)[Z];R.insertBefore(Q,R.firstElementChild||R.children[Z]);return false}}}K();v(S,_c);F(L);return true}
dbvtkviewer.succeeded=dbvtkviewer();