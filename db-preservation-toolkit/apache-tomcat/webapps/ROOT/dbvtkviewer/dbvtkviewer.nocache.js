function dbvtkviewer(){var S='bootstrap',T='begin',U='gwt.codesvr.dbvtkviewer=',V='gwt.codesvr=',W='dbvtkviewer',X='startup',Y='DUMMY',Z=0,$=1,_='iframe',ab='javascript:""',bb='position:absolute; width:0; height:0; border:none; left: -1000px;',cb=' top: -1000px;',db='CSS1Compat',eb='<!doctype html>',fb='',gb='<html><head><\/head><body><\/body><\/html>',hb='undefined',ib='DOMContentLoaded',jb=50,kb='Chrome',lb='eval("',mb='");',nb='script',ob='javascript',pb='moduleStartup',qb='moduleRequested',rb='Failed to load ',sb='head',tb='meta',ub='name',vb='dbvtkviewer::',wb='::',xb='gwt:property',yb='content',zb='=',Ab='gwt:onPropertyErrorFn',Bb='Bad handler "',Cb='" for "gwt:onPropertyErrorFn"',Db='gwt:onLoadErrorFn',Eb='" for "gwt:onLoadErrorFn"',Fb='#',Gb='?',Hb='/',Ib='img',Jb='clear.cache.gif',Kb='baseUrl',Lb='dbvtkviewer.nocache.js',Mb='base',Nb='//',Ob='locale',Pb='en',Qb='locale=',Rb=7,Sb='&',Tb='_',Ub='__gwt_Locale',Vb='Unexpected exception in locale detection, using default: ',Wb=2,Xb='supportsDateTimeInput',Yb='input',Zb='type',$b='datetime',_b='text',ac='y',bc='n',cc='user.agent',dc='webkit',ec='safari',fc='msie',gc=10,hc=11,ic='ie10',jc=9,kc='ie9',lc=8,mc='ie8',nc='gecko',oc='gecko1_8',pc=3,qc=4,rc='selectingPermutation',sc='dbvtkviewer.devmode.js',tc='default',uc='05C231527B4C93785EEB0217D2B1D247',vc='11A17B9288B6084C20437C89429458E1',wc=':1',xc='20D21D96B21379FCFBD7A0F7FBCEB150',yc='287F349783D72FA1B90FA5BA78CAE28B',zc='494206A92C0AAF51BEC5BE37A4785CDA',Ac='pt_PT',Bc='5471865E4F314E725F2FCFC4D395A281',Cc='605375ED2B259F11775F8A05850C9065',Dc='68B8A98B4D927F11E47C7B88EFF29A26',Ec='6D691EBDDB81227A3357DBEAA656A663',Fc='73584B84741A6FF35BEC438228C927E9',Gc='7D2BCBB1E6CE6E3CE02BAAFB6E0AF25F',Hc='947815F3AA4EDB01EF4187E70B55DB8B',Ic='959E113BD51FDC58E354DEA4CE3CB2EF',Jc='A98FDD4A6DEF5D47E839E79C913165A9',Kc='AEBDEDAD323024B3D729199BF3AD4BB7',Lc='CCF1690DFE25E202C374491480EDD6F6',Mc='E31C86BA6304F83C58FDBE90F6F08249',Nc='F5E4D960FB816C2B8D8071A1F1525778',Oc=':',Pc='.cache.js',Qc='link',Rc='rel',Sc='stylesheet',Tc='href',Uc='loadExternalRefs',Vc='timebox.css',Wc='fontawesome/css/font-awesome.min.css',Xc='roda_main.css',Yc='main.css',Zc='end',$c='http:',_c='file:',ad='_gwt_dummy_',bd='__gwtDevModeHook:dbvtkviewer',cd='Ignoring non-whitelisted Dev Mode URL: ',dd=':moduleBase';var s=window;var t=document;v(S,T);function u(){var a=s.location.search;return a.indexOf(U)!=-1||a.indexOf(V)!=-1}
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
o[Ob]=function(){var b=null;var c=Pb;try{if(!b){var d=location.search;var e=d.indexOf(Qb);if(e>=Z){var f=d.substring(e+Rb);var g=d.indexOf(Sb,e);if(g<Z){g=d.length}b=d.substring(e+Rb,g)}}if(!b){b=__gwt_getMetaProperty(Ob)}if(!b){var h=navigator.browserLanguage?navigator.browserLanguage:navigator.language;if(h){var i=h.split(/[-_]/);if(i.length>$){i[$]=i[$].toUpperCase()}b=i.join(Tb)}}if(!b){b=s[Ub]}if(b){c=b}while(b&&!__gwt_isKnownPropertyValue(Ob,b)){var j=b.lastIndexOf(Tb);if(j<Z){b=null;break}b=b.substring(Z,j)}}catch(a){alert(Vb+a)}s[Ub]=c;return b||Pb};n[Ob]={'default':Z,en:$,pt_PT:Wb};o[Xb]=function(){try{var b=document.createElement(Yb);b.setAttribute(Zb,$b);return b.type!==_b?ac:bc}catch(a){return bc}};n[Xb]={n:Z,y:$};o[cc]=function(){var a=navigator.userAgent.toLowerCase();var b=t.documentMode;if(function(){return a.indexOf(dc)!=-1}())return ec;if(function(){return a.indexOf(fc)!=-1&&(b>=gc&&b<hc)}())return ic;if(function(){return a.indexOf(fc)!=-1&&(b>=jc&&b<hc)}())return kc;if(function(){return a.indexOf(fc)!=-1&&(b>=lc&&b<hc)}())return mc;if(function(){return a.indexOf(nc)!=-1||b>=hc}())return oc;return fb};n[cc]={gecko1_8:Z,ie10:$,ie8:Wb,ie9:pc,safari:qc};__gwt_isKnownPropertyValue=function(a,b){return b in n[a]};dbvtkviewer.__getPropMap=function(){var a={};for(var b in n){if(n.hasOwnProperty(b)){a[b]=p(b)}}return a};dbvtkviewer.__computePropValue=p;s.__gwt_activeModules[W].bindings=dbvtkviewer.__getPropMap;v(S,rc);if(u()){return I(sc)}var q;try{m([tc,ac,ec],uc);m([tc,bc,oc],vc);m([tc,ac,oc],vc);m([tc,bc,oc],vc+wc);m([tc,ac,oc],vc+wc);m([Pb,bc,oc],xc);m([Pb,ac,oc],xc);m([Pb,bc,oc],xc+wc);m([Pb,ac,oc],xc+wc);m([tc,bc,kc],yc);m([tc,ac,kc],yc);m([tc,bc,kc],yc+wc);m([tc,ac,kc],yc+wc);m([tc,bc,mc],zc);m([tc,ac,mc],zc);m([tc,bc,mc],zc+wc);m([tc,ac,mc],zc+wc);m([Ac,ac,ec],Bc);m([Pb,bc,ic],Cc);m([Pb,ac,ic],Cc);m([Pb,bc,ic],Cc+wc);m([Pb,ac,ic],Cc+wc);m([Ac,bc,oc],Dc);m([Ac,ac,oc],Dc);m([Ac,bc,oc],Dc+wc);m([Ac,ac,oc],Dc+wc);m([Ac,bc,kc],Ec);m([Ac,ac,kc],Ec);m([Ac,bc,kc],Ec+wc);m([Ac,ac,kc],Ec+wc);m([Pb,bc,mc],Fc);m([Pb,ac,mc],Fc);m([Pb,bc,mc],Fc+wc);m([Pb,ac,mc],Fc+wc);m([Ac,bc,mc],Gc);m([Ac,ac,mc],Gc);m([Ac,bc,mc],Gc+wc);m([Ac,ac,mc],Gc+wc);m([Ac,bc,ic],Hc);m([Ac,ac,ic],Hc);m([Ac,bc,ic],Hc+wc);m([Ac,ac,ic],Hc+wc);m([Ac,bc,ec],Ic);m([tc,bc,ec],Jc);m([Pb,bc,kc],Kc);m([Pb,ac,kc],Kc);m([Pb,bc,kc],Kc+wc);m([Pb,ac,kc],Kc+wc);m([Pb,ac,ec],Lc);m([Pb,bc,ec],Mc);m([tc,bc,ic],Nc);m([tc,ac,ic],Nc);m([tc,bc,ic],Nc+wc);m([tc,ac,ic],Nc+wc);q=k[p(Ob)][p(Xb)][p(cc)];var r=q.indexOf(Oc);if(r!=-1){l=parseInt(q.substring(r+$),gc);q=q.substring(Z,r)}}catch(a){}dbvtkviewer.__softPermutationId=l;return I(q+Pc)}
function K(){if(!s.__gwt_stylesLoaded){s.__gwt_stylesLoaded={}}function c(a){if(!__gwt_stylesLoaded[a]){var b=t.createElement(Qc);b.setAttribute(Rc,Sc);b.setAttribute(Tc,I(a));t.getElementsByTagName(sb)[Z].appendChild(b);__gwt_stylesLoaded[a]=true}}
v(Uc,T);c(Vc);c(Wc);c(Xc);c(Yc);v(Uc,Zc)}
G();dbvtkviewer.__moduleBase=H();A[W].moduleBase=dbvtkviewer.__moduleBase;var L=J();if(s){var M=!!(s.location.protocol==$c||s.location.protocol==_c);s.__gwt_activeModules[W].canRedirect=M;function N(){var b=ad;try{s.sessionStorage.setItem(b,b);s.sessionStorage.removeItem(b);return true}catch(a){return false}}
if(M&&N()){var O=bd;var P=s.sessionStorage[O];if(!/^http:\/\/(localhost|127\.0\.0\.1)(:\d+)?\/.*$/.test(P)){if(P&&(window.console&&console.log)){console.log(cd+P)}P=fb}if(P&&!s[O]){s[O]=true;s[O+dd]=H();var Q=t.createElement(nb);Q.src=P;var R=t.getElementsByTagName(sb)[Z];R.insertBefore(Q,R.firstElementChild||R.children[Z]);return false}}}K();v(S,Zc);F(L);return true}
dbvtkviewer.succeeded=dbvtkviewer();