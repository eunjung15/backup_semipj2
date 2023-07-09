(function () {
  /* 
 
 Copyright The Closure Library Authors. 
 SPDX-License-Identifier: Apache-2.0 
*/
  var ca;
  function da(a) {
    var b = 0;
    return function () {
      return b < a.length ? { done: !1, value: a[b++] } : { done: !0 };
    };
  }
  var ea =
    "function" == typeof Object.defineProperties
      ? Object.defineProperty
      : function (a, b, c) {
          if (a == Array.prototype || a == Object.prototype) return a;
          a[b] = c.value;
          return a;
        };
  function fa(a) {
    a = [
      "object" == typeof globalThis && globalThis,
      a,
      "object" == typeof window && window,
      "object" == typeof self && self,
      "object" == typeof global && global,
    ];
    for (var b = 0; b < a.length; ++b) {
      var c = a[b];
      if (c && c.Math == Math) return c;
    }
    throw Error("Cannot find global object");
  }
  var ha = fa(this),
    ia = "function" === typeof Symbol && "symbol" === typeof Symbol("x"),
    k = {},
    ja = {};
  function t(a, b, c) {
    if (!c || null != a) {
      c = ja[b];
      if (null == c) return a[b];
      c = a[c];
      return void 0 !== c ? c : a[b];
    }
  }
  function u(a, b, c) {
    if (b)
      a: {
        var d = a.split(".");
        a = 1 === d.length;
        var e = d[0],
          f;
        !a && e in k ? (f = k) : (f = ha);
        for (e = 0; e < d.length - 1; e++) {
          var g = d[e];
          if (!(g in f)) break a;
          f = f[g];
        }
        d = d[d.length - 1];
        c = ia && "es6" === c ? f[d] : null;
        b = b(c);
        null != b &&
          (a
            ? ea(k, d, { configurable: !0, writable: !0, value: b })
            : b !== c &&
              (void 0 === ja[d] &&
                ((a = (1e9 * Math.random()) >>> 0),
                (ja[d] = ia ? ha.Symbol(d) : "$jscp$" + a + "$" + d)),
              ea(f, ja[d], { configurable: !0, writable: !0, value: b })));
      }
  }
  u(
    "Symbol",
    function (a) {
      function b(f) {
        if (this instanceof b)
          throw new TypeError("Symbol is not a constructor");
        return new c(d + (f || "") + "_" + e++, f);
      }
      function c(f, g) {
        this.g = f;
        ea(this, "description", { configurable: !0, writable: !0, value: g });
      }
      if (a) return a;
      c.prototype.toString = function () {
        return this.g;
      };
      var d = "jscomp_symbol_" + ((1e9 * Math.random()) >>> 0) + "_",
        e = 0;
      return b;
    },
    "es6"
  );
  u(
    "Symbol.iterator",
    function (a) {
      if (a) return a;
      a = (0, k.Symbol)("Symbol.iterator");
      for (
        var b =
            "Array Int8Array Uint8Array Uint8ClampedArray Int16Array Uint16Array Int32Array Uint32Array Float32Array Float64Array".split(
              " "
            ),
          c = 0;
        c < b.length;
        c++
      ) {
        var d = ha[b[c]];
        "function" === typeof d &&
          "function" != typeof d.prototype[a] &&
          ea(d.prototype, a, {
            configurable: !0,
            writable: !0,
            value: function () {
              return ka(da(this));
            },
          });
      }
      return a;
    },
    "es6"
  );
  function ka(a) {
    a = { next: a };
    a[t(k.Symbol, "iterator")] = function () {
      return this;
    };
    return a;
  }
  var la =
    ia && "function" == typeof t(Object, "assign")
      ? t(Object, "assign")
      : function (a, b) {
          for (var c = 1; c < arguments.length; c++) {
            var d = arguments[c];
            if (d)
              for (var e in d)
                Object.prototype.hasOwnProperty.call(d, e) && (a[e] = d[e]);
          }
          return a;
        };
  u(
    "Object.assign",
    function (a) {
      return a || la;
    },
    "es6"
  );
  function pa(a, b, c) {
    if (null == a)
      throw new TypeError(
        "The 'this' value for String.prototype." +
          c +
          " must not be null or undefined"
      );
    if (b instanceof RegExp)
      throw new TypeError(
        "First argument to String.prototype." +
          c +
          " must not be a regular expression"
      );
    return a + "";
  }
  u(
    "String.prototype.endsWith",
    function (a) {
      return a
        ? a
        : function (b, c) {
            var d = pa(this, b, "endsWith");
            void 0 === c && (c = d.length);
            c = Math.max(0, Math.min(c | 0, d.length));
            for (var e = b.length; 0 < e && 0 < c; )
              if (d[--c] != b[--e]) return !1;
            return 0 >= e;
          };
    },
    "es6"
  );
  function qa(a, b) {
    a instanceof String && (a += "");
    var c = 0,
      d = !1,
      e = {
        next: function () {
          if (!d && c < a.length) {
            var f = c++;
            return { value: b(f, a[f]), done: !1 };
          }
          d = !0;
          return { done: !0, value: void 0 };
        },
      };
    e[t(k.Symbol, "iterator")] = function () {
      return e;
    };
    return e;
  }
  u(
    "Array.prototype.entries",
    function (a) {
      return a
        ? a
        : function () {
            return qa(this, function (b, c) {
              return [b, c];
            });
          };
    },
    "es6"
  );
  u(
    "Array.prototype.keys",
    function (a) {
      return a
        ? a
        : function () {
            return qa(this, function (b) {
              return b;
            });
          };
    },
    "es6"
  );
  u(
    "globalThis",
    function (a) {
      return a || ha;
    },
    "es_2020"
  );
  u(
    "Object.values",
    function (a) {
      return a
        ? a
        : function (b) {
            var c = [],
              d;
            for (d in b)
              Object.prototype.hasOwnProperty.call(b, d) && c.push(b[d]);
            return c;
          };
    },
    "es8"
  );
  u(
    "Array.prototype.values",
    function (a) {
      return a
        ? a
        : function () {
            return qa(this, function (b, c) {
              return c;
            });
          };
    },
    "es8"
  );
  u(
    "Object.is",
    function (a) {
      return a
        ? a
        : function (b, c) {
            return b === c ? 0 !== b || 1 / b === 1 / c : b !== b && c !== c;
          };
    },
    "es6"
  );
  u(
    "Array.prototype.includes",
    function (a) {
      return a
        ? a
        : function (b, c) {
            var d = this;
            d instanceof String && (d = String(d));
            var e = d.length;
            c = c || 0;
            for (0 > c && (c = Math.max(c + e, 0)); c < e; c++) {
              var f = d[c];
              if (f === b || t(Object, "is").call(Object, f, b)) return !0;
            }
            return !1;
          };
    },
    "es7"
  );
  u(
    "String.prototype.includes",
    function (a) {
      return a
        ? a
        : function (b, c) {
            return -1 !== pa(this, b, "includes").indexOf(b, c || 0);
          };
    },
    "es6"
  );
  u(
    "Object.entries",
    function (a) {
      return a
        ? a
        : function (b) {
            var c = [],
              d;
            for (d in b)
              Object.prototype.hasOwnProperty.call(b, d) && c.push([d, b[d]]);
            return c;
          };
    },
    "es8"
  );
  var v = this || self;
  function ra(a, b) {
    function c() {}
    c.prototype = b.prototype;
    a.ca = b.prototype;
    a.prototype = new c();
    a.prototype.constructor = a;
    a.Y = function (d, e, f) {
      for (
        var g = Array(arguments.length - 2), h = 2;
        h < arguments.length;
        h++
      )
        g[h - 2] = arguments[h];
      return b.prototype[e].apply(d, g);
    };
  }
  function sa(a) {
    return a;
  }
  function w(a) {
    a = parseFloat(a);
    return isNaN(a) || 1 < a || 0 > a ? 0 : a;
  }
  function ta(a, b) {
    if (Error.captureStackTrace) Error.captureStackTrace(this, ta);
    else {
      var c = Error().stack;
      c && (this.stack = c);
    }
    a && (this.message = String(a));
    void 0 !== b && (this.cause = b);
  }
  ra(ta, Error);
  ta.prototype.name = "CustomError";
  function ua(a, b) {
    a = a.split("%s");
    for (var c = "", d = a.length - 1, e = 0; e < d; e++)
      c += a[e] + (e < b.length ? b[e] : "%s");
    ta.call(this, c + a[d]);
  }
  ra(ua, ta);
  ua.prototype.name = "AssertionError";
  function y(a, b) {
    this.h = (a === va && b) || "";
    this.G = wa;
  }
  y.prototype.j = !0;
  y.prototype.g = function () {
    return this.h;
  };
  function xa(a) {
    return a instanceof y && a.constructor === y && a.G === wa
      ? a.h
      : "type_error:Const";
  }
  var wa = {},
    va = {};
  function ya(a) {
    var b = !1,
      c;
    return function () {
      b || ((c = a()), (b = !0));
      return c;
    };
  }
  var za = Array.prototype.indexOf
      ? function (a, b) {
          return Array.prototype.indexOf.call(a, b, void 0);
        }
      : function (a, b) {
          if ("string" === typeof a)
            return "string" !== typeof b || 1 != b.length
              ? -1
              : a.indexOf(b, 0);
          for (var c = 0; c < a.length; c++) if (c in a && a[c] === b) return c;
          return -1;
        },
    Aa = Array.prototype.some
      ? function (a, b) {
          return Array.prototype.some.call(a, b, void 0);
        }
      : function (a, b) {
          for (
            var c = a.length,
              d = "string" === typeof a ? a.split("") : a,
              e = 0;
            e < c;
            e++
          )
            if (e in d && b.call(void 0, d[e], e, a)) return !0;
          return !1;
        };
  var Ba, Ca;
  a: {
    for (var Da = ["CLOSURE_FLAGS"], Ea = v, Fa = 0; Fa < Da.length; Fa++)
      if (((Ea = Ea[Da[Fa]]), null == Ea)) {
        Ca = null;
        break a;
      }
    Ca = Ea;
  }
  var Ga = Ca && Ca[610401301];
  Ba = null != Ga ? Ga : !1;
  function Ja(a) {
    if (!Ka.test(a)) return a;
    -1 != a.indexOf("&") && (a = a.replace(La, "&amp;"));
    -1 != a.indexOf("<") && (a = a.replace(Ma, "&lt;"));
    -1 != a.indexOf(">") && (a = a.replace(Na, "&gt;"));
    -1 != a.indexOf('"') && (a = a.replace(Oa, "&quot;"));
    -1 != a.indexOf("'") && (a = a.replace(Pa, "&#39;"));
    -1 != a.indexOf("\x00") && (a = a.replace(Qa, "&#0;"));
    return a;
  }
  var La = /&/g,
    Ma = /</g,
    Na = />/g,
    Oa = /"/g,
    Pa = /'/g,
    Qa = /\x00/g,
    Ka = /[\x00&<>"']/;
  function Ra() {
    var a = v.navigator;
    return a && (a = a.userAgent) ? a : "";
  }
  var Sa,
    Ta = v.navigator;
  Sa = Ta ? Ta.userAgentData || null : null;
  function Ua(a) {
    return Ba
      ? Sa
        ? Sa.brands.some(function (b) {
            return (b = b.brand) && -1 != b.indexOf(a);
          })
        : !1
      : !1;
  }
  function A(a) {
    return -1 != Ra().indexOf(a);
  }
  function C() {
    return Ba ? !!Sa && 0 < Sa.brands.length : !1;
  }
  function Va() {
    return C()
      ? Ua("Chromium")
      : ((A("Chrome") || A("CriOS")) && !(C() ? 0 : A("Edge"))) || A("Silk");
  }
  function Wa(a) {
    Wa[" "](a);
    return a;
  }
  Wa[" "] = function () {};
  var Xa = {
    area: !0,
    base: !0,
    br: !0,
    col: !0,
    command: !0,
    embed: !0,
    hr: !0,
    img: !0,
    input: !0,
    keygen: !0,
    link: !0,
    meta: !0,
    param: !0,
    source: !0,
    track: !0,
    wbr: !0,
  };
  var Ya;
  function Za() {
    if (void 0 === Ya) {
      var a = null,
        b = v.trustedTypes;
      if (b && b.createPolicy) {
        try {
          a = b.createPolicy("goog#html", {
            createHTML: sa,
            createScript: sa,
            createScriptURL: sa,
          });
        } catch (c) {
          v.console && v.console.error(c.message);
        }
        Ya = a;
      } else Ya = a;
    }
    return Ya;
  }
  function D(a) {
    this.h = a;
  }
  D.prototype.toString = function () {
    return this.h + "";
  };
  D.prototype.j = !0;
  D.prototype.g = function () {
    return this.h.toString();
  };
  function $a(a) {
    return a instanceof D && a.constructor === D
      ? a.h
      : "type_error:TrustedResourceUrl";
  }
  var ab = /^([^?#]*)(\?[^#]*)?(#[\s\S]*)?/,
    bb = {};
  function cb(a) {
    var b = Za();
    a = b ? b.createScriptURL(a) : a;
    return new D(a, bb);
  }
  function db(a, b, c) {
    if (null == c) return b;
    if ("string" === typeof c) return c ? a + encodeURIComponent(c) : "";
    for (var d in c)
      if (Object.prototype.hasOwnProperty.call(c, d)) {
        var e = c[d];
        e = Array.isArray(e) ? e : [e];
        for (var f = 0; f < e.length; f++) {
          var g = e[f];
          null != g &&
            (b || (b = a),
            (b +=
              (b.length > a.length ? "&" : "") +
              encodeURIComponent(d) +
              "=" +
              encodeURIComponent(String(g))));
        }
      }
    return b;
  }
  function E(a) {
    this.h = a;
  }
  E.prototype.toString = function () {
    return this.h.toString();
  };
  E.prototype.j = !0;
  E.prototype.g = function () {
    return this.h.toString();
  };
  function eb(a) {
    return a instanceof E && a.constructor === E ? a.h : "type_error:SafeUrl";
  }
  var fb = /^data:(.*);base64,[a-z0-9+\/]+=*$/i,
    gb = /^(?:(?:https?|mailto|ftp):|[^:/?#]*(?:[/?#]|$))/i;
  function hb(a) {
    if (a instanceof E) return a;
    a = "object" == typeof a && a.j ? a.g() : String(a);
    gb.test(a)
      ? (a = new E(a, ib))
      : ((a = String(a).replace(/(%0A|%0D)/g, "")),
        (a = a.match(fb) ? new E(a, ib) : null));
    return a;
  }
  var ib = {},
    jb = new E("about:invalid#zClosurez", ib);
  var kb = {};
  function F(a) {
    this.h = a;
    this.j = !0;
  }
  F.prototype.g = function () {
    return this.h;
  };
  F.prototype.toString = function () {
    return this.h.toString();
  };
  var lb = new F("", kb);
  function mb(a) {
    if (a instanceof E)
      return (
        'url("' + eb(a).replace(/</g, "%3c").replace(/[\\"]/g, "\\$&") + '")'
      );
    if (a instanceof y) a = xa(a);
    else {
      a = String(a);
      var b = a.replace(nb, "$1").replace(nb, "$1").replace(ob, "url");
      if (pb.test(b)) {
        if ((b = !qb.test(a))) {
          for (var c = (b = !0), d = 0; d < a.length; d++) {
            var e = a.charAt(d);
            "'" == e && c ? (b = !b) : '"' == e && b && (c = !c);
          }
          b = b && c && sb(a);
        }
        a = b ? tb(a) : "zClosurez";
      } else a = "zClosurez";
    }
    if (/[{;}]/.test(a))
      throw new ua("Value does not allow [{;}], got: %s.", [a]);
    return a;
  }
  function sb(a) {
    for (var b = !0, c = /^[-_a-zA-Z0-9]$/, d = 0; d < a.length; d++) {
      var e = a.charAt(d);
      if ("]" == e) {
        if (b) return !1;
        b = !0;
      } else if ("[" == e) {
        if (!b) return !1;
        b = !1;
      } else if (!b && !c.test(e)) return !1;
    }
    return b;
  }
  var pb = RegExp("^[-+,.\"'%_!#/ a-zA-Z0-9\\[\\]]+$"),
    ob = RegExp(
      "\\b(url\\([ \t\n]*)('[ -&(-\\[\\]-~]*'|\"[ !#-\\[\\]-~]*\"|[!#-&*-\\[\\]-~]*)([ \t\n]*\\))",
      "g"
    ),
    nb = RegExp(
      "\\b(calc|cubic-bezier|fit-content|hsl|hsla|linear-gradient|matrix|minmax|radial-gradient|repeat|rgb|rgba|(rotate|scale|translate)(X|Y|Z|3d)?|steps|var)\\([-+*/0-9a-zA-Z.%#\\[\\], ]+\\)",
      "g"
    ),
    qb = /\/\*/;
  function tb(a) {
    return a.replace(ob, function (b, c, d, e) {
      var f = "";
      d = d.replace(/^(['"])(.*)\1$/, function (g, h, l) {
        f = h;
        return l;
      });
      b = (hb(d) || jb).g();
      return c + f + b + f + e;
    });
  }
  var ub = {};
  function G(a) {
    this.h = a;
    this.j = !0;
  }
  G.prototype.g = function () {
    return this.h.toString();
  };
  G.prototype.toString = function () {
    return this.h.toString();
  };
  function vb(a) {
    return a instanceof G && a.constructor === G ? a.h : "type_error:SafeHtml";
  }
  function wb(a) {
    return a instanceof G
      ? a
      : xb(Ja("object" == typeof a && a.j ? a.g() : String(a)));
  }
  function yb(a) {
    function b(e) {
      Array.isArray(e) ? e.forEach(b) : ((e = wb(e)), d.push(vb(e).toString()));
    }
    var c = wb(zb),
      d = [];
    a.forEach(b);
    return xb(d.join(vb(c).toString()));
  }
  function Ab(a) {
    return yb(Array.prototype.slice.call(arguments));
  }
  function xb(a) {
    var b = Za();
    a = b ? b.createHTML(a) : a;
    return new G(a, ub);
  }
  var Bb = /^[a-zA-Z0-9-]+$/,
    Cb = {
      action: !0,
      cite: !0,
      data: !0,
      formaction: !0,
      href: !0,
      manifest: !0,
      poster: !0,
      src: !0,
    },
    Db = {
      APPLET: !0,
      BASE: !0,
      EMBED: !0,
      IFRAME: !0,
      LINK: !0,
      MATH: !0,
      META: !0,
      OBJECT: !0,
      SCRIPT: !0,
      STYLE: !0,
      SVG: !0,
      TEMPLATE: !0,
    },
    zb = new G((v.trustedTypes && v.trustedTypes.emptyHTML) || "", ub);
  var Eb = RegExp(
    "^(?:([^:/?#.]+):)?(?://(?:([^\\\\/?#]*)@)?([^\\\\/?#]*?)(?::([0-9]+))?(?=[\\\\/?#]|$))?([^?#]+)?(?:\\?([^#]*))?(?:#([\\s\\S]*))?$"
  );
  function Fb(a) {
    var b = a.match(Eb);
    a = b[5];
    var c = b[6];
    b = b[7];
    var d = "";
    a && (d += a);
    c && (d += "?" + c);
    b && (d += "#" + b);
    return d;
  }
  function Gb(a, b, c, d) {
    for (var e = c.length; 0 <= (b = a.indexOf(c, b)) && b < d; ) {
      var f = a.charCodeAt(b - 1);
      if (38 == f || 63 == f)
        if (((f = a.charCodeAt(b + e)), !f || 61 == f || 38 == f || 35 == f))
          return b;
      b += e + 1;
    }
    return -1;
  }
  var Hb = /#|$/;
  function Ib(a, b) {
    var c = a.search(Hb),
      d = Gb(a, 0, b, c);
    if (0 > d) return null;
    var e = a.indexOf("&", d);
    if (0 > e || e > c) e = c;
    d += b.length + 1;
    return decodeURIComponent(a.slice(d, -1 !== e ? e : 0).replace(/\+/g, " "));
  }
  var Jb = /[?&]($|#)/;
  function I(a, b, c) {
    for (var d = a.search(Hb), e = 0, f, g = []; 0 <= (f = Gb(a, e, b, d)); )
      g.push(a.substring(e, f)), (e = Math.min(a.indexOf("&", f) + 1 || d, d));
    g.push(a.slice(e));
    a = g.join("").replace(Jb, "$1");
    c = null != c ? "=" + encodeURIComponent(String(c)) : "";
    (b += c)
      ? ((c = a.indexOf("#")),
        0 > c && (c = a.length),
        (d = a.indexOf("?")),
        0 > d || d > c ? ((d = c), (e = "")) : (e = a.substring(d + 1, c)),
        (c = [a.slice(0, d), e, a.slice(c)]),
        (a = c[1]),
        (c[1] = b ? (a ? a + "&" + b : b) : a),
        (b = c[0] + (c[1] ? "?" + c[1] : "") + c[2]))
      : (b = a);
    return b;
  } /* 
 
 SPDX-License-Identifier: Apache-2.0 
*/
  function Kb(a, b) {
    a.src = $a(b);
    var c, d;
    (c = (b =
      null ==
      (d = (c = ((a.ownerDocument && a.ownerDocument.defaultView) || window)
        .document).querySelector)
        ? void 0
        : d.call(c, "script[nonce]"))
      ? b.nonce || b.getAttribute("nonce") || ""
      : "") && a.setAttribute("nonce", c);
  }
  function Lb(a, b) {
    a.write(vb(b));
  }
  function Mb(a) {
    try {
      var b;
      if ((b = !!a && null != a.location.href))
        a: {
          try {
            Wa(a.foo);
            b = !0;
            break a;
          } catch (c) {}
          b = !1;
        }
      return b;
    } catch (c) {
      return !1;
    }
  }
  function Nb() {
    if (!k.globalThis.crypto) return Math.random();
    try {
      var a = new Uint32Array(1);
      k.globalThis.crypto.getRandomValues(a);
      return a[0] / 65536 / 65536;
    } catch (b) {
      return Math.random();
    }
  }
  function Ob(a, b) {
    if (a)
      for (var c in a)
        Object.prototype.hasOwnProperty.call(a, c) && b(a[c], c, a);
  }
  var Qb = ya(function () {
      return (
        Aa(
          [
            "Google Web Preview",
            "Mediapartners-Google",
            "Google-Read-Aloud",
            "Google-Adwords",
          ],
          Pb
        ) || 1e-4 > Math.random()
      );
    }),
    Rb = ya(function () {
      return Pb("MSIE");
    });
  function Pb(a) {
    return -1 != Ra().indexOf(a);
  }
  function J(a) {
    return /^true$/.test(a);
  }
  function Sb(a, b) {
    if (!a || !b.head) return null;
    var c = Tb("META");
    b.head.appendChild(c);
    c.httpEquiv = "origin-trial";
    c.content = a;
    return c;
  }
  function Tb(a, b) {
    b = void 0 === b ? document : b;
    return b.createElement(String(a).toLowerCase());
  }
  var Ub = w("0.20"),
    Vb = w("0.002"),
    Wb = w("1.0"),
    Xb = w("0.00"),
    Yb = w("0.00"),
    Zb = w("0.00"),
    $b = J("false"),
    ac = J("true"),
    bc = J("true"),
    cc = J("true"),
    dc = J("true"),
    ec = J("true");
  var fc = null;
  function gc() {
    if (null === fc) {
      fc = "";
      try {
        var a = "";
        try {
          a = v.top.location.hash;
        } catch (c) {
          a = v.location.hash;
        }
        if (a) {
          var b = a.match(/\bdeid=([\d,]+)/);
          fc = b ? b[1] : "";
        }
      } catch (c) {}
    }
    return fc;
  }
  function K(a, b, c) {
    var d = M;
    if (c ? d.g.hasOwnProperty(c) && "" == d.g[c] : 1) {
      var e;
      e = (e = gc())
        ? (e = e.match(new RegExp("\\b(" + a.join("|") + ")\\b")))
          ? e[0]
          : null
        : null;
      if (e) a = e;
      else
        a: {
          if (!Rb() && !Qb() && ((e = Math.random()), e < b)) {
            e = Nb();
            a = a[Math.floor(e * a.length)];
            break a;
          }
          a = null;
        }
      a &&
        "" != a &&
        (c ? d.g.hasOwnProperty(c) && (d.g[c] = a) : (d.h[a] = !0));
    }
  }
  function N(a) {
    var b = M;
    return b.g.hasOwnProperty(a) ? b.g[a] : "";
  }
  function hc() {
    var a = M,
      b = [];
    Ob(a.h, function (c, d) {
      b.push(d);
    });
    Ob(a.g, function (c) {
      "" != c && b.push(c);
    });
    return b;
  }
  var ic = {
      N: 2,
      V: 13,
      U: 14,
      R: 16,
      P: 17,
      O: 18,
      M: 19,
      X: 20,
      W: 21,
      L: 22,
    },
    M = null;
  function jc() {
    return !!M && ("466465926" == N(20) || "466465925" == N(20));
  }
  function kc() {
    return !!M && "592230571" == N(16);
  }
  function lc() {
    return !!M && ("512247839" == N(22) || "512247838" == N(22));
  }
  function mc(a) {
    var b = void 0 === b ? v : b;
    var c, d;
    return (
      (null == (c = b.performance)
        ? void 0
        : null == (d = c.timing)
        ? void 0
        : d[a]) || 0
    );
  }
  function O(a) {
    var b = "u";
    if (a.u && a.hasOwnProperty(b)) return a.u;
    b = new a();
    return (a.u = b);
  }
  var nc = { S: 0, I: 1, T: 2, K: 3, J: 4 };
  function oc() {
    this.g = {};
  }
  function pc(a, b, c) {
    "number" === typeof c && 0 < c && (a.g[b] = Math.round(c));
  }
  function qc(a) {
    var b = O(oc);
    var c = void 0 === c ? v : c;
    c = c.performance;
    pc(b, a, c && c.now ? c.now() : null);
  }
  function rc() {
    function a() {
      return pc(b, 0, mc("loadEventStart") - mc("navigationStart"));
    }
    var b = O(oc);
    0 != mc("loadEventStart") ? a() : window.addEventListener("load", a);
  }
  function sc() {
    var a = O(oc);
    return t(Object, "values")
      .call(Object, nc)
      .map(function (b) {
        return [b, a.g[b] || 0];
      });
  }
  var tc = J("false");
  var uc = {};
  function P(a) {
    uc.TAGGING = uc.TAGGING || [];
    uc.TAGGING[a] = !0;
  }
  function vc(a) {
    return "string" === typeof a;
  }
  var wc = Array.isArray;
  function xc(a, b) {
    if (a && wc(a))
      for (var c = 0; c < a.length; c++) if (a[c] && b(a[c])) return a[c];
  }
  function yc(a, b) {
    for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && b(c, a[c]);
  }
  function zc(a) {
    a = Ac(a);
    return xb(a);
  }
  function Ac(a) {
    return null === a ? "null" : void 0 === a ? "undefined" : a;
  }
  var Q = window,
    R = document;
  function Bc(a, b) {
    b &&
      (a.addEventListener
        ? (a.onload = b)
        : (a.onreadystatechange = function () {
            a.readyState in { loaded: 1, complete: 1 } &&
              ((a.onreadystatechange = null), b());
          }));
  }
  var Cc = { async: 1, nonce: 1, onerror: 1, onload: 1, src: 1, type: 1 },
    Dc = { onload: 1, src: 1, width: 1, height: 1, style: 1 };
  function Ec(a, b, c) {
    b &&
      yc(b, function (d, e) {
        d = d.toLowerCase();
        c.hasOwnProperty(d) || a.setAttribute(d, e);
      });
  }
  function Fc(a, b, c, d) {
    var e = R.createElement("script");
    Ec(e, c, Cc);
    e.type = "text/javascript";
    e.async = !0;
    a = cb(Ac(a));
    Kb(e, a);
    Bc(e, b);
    d
      ? d.appendChild(e)
      : ((b = R.getElementsByTagName("script")[0] || R.body || R.head),
        b.parentNode.insertBefore(e, b));
  }
  function Gc(a, b, c) {
    var d = !1;
    d = void 0 === d ? !0 : d;
    var e = !1;
    c || ((c = R.createElement("iframe")), (e = !0));
    Ec(c, void 0, Dc);
    d &&
      ((c.height = "0"),
      (c.width = "0"),
      (c.style.display = "none"),
      (c.style.visibility = "hidden"));
    e &&
      ((d = (R.body && R.body.lastChild) || R.body || R.head),
      d.parentNode.insertBefore(c, d));
    Bc(c, b);
    void 0 !== a && (c.src = a);
  }
  function Hc() {
    var a = void 0 === a ? document : a;
    var b;
    return !(
      null == (b = a.featurePolicy) ||
      !((ca = b.allowedFeatures()), t(ca, "includes")).call(
        ca,
        "attribution-reporting"
      )
    );
  }
  function Ic(a, b, c) {
    a = Jc(a, !0);
    if (a[b]) return !1;
    a[b] = [];
    a[b][0] = c;
    return !0;
  }
  function Jc(a, b) {
    var c = a.GooglebQhCsO;
    c || ((c = {}), b && (a.GooglebQhCsO = c));
    return c;
  }
  !A("Android") || Va();
  Va();
  A("Safari") &&
    (Va() ||
      (C() ? 0 : A("Coast")) ||
      (C() ? 0 : A("Opera")) ||
      (C() ? 0 : A("Edge")) ||
      (C() ? Ua("Microsoft Edge") : A("Edg/")) ||
      (C() && Ua("Opera")));
  var Kc = {},
    Lc = null;
  function Mc(a) {
    for (var b = [], c = 0, d = 0; d < a.length; d++) {
      var e = a.charCodeAt(d);
      255 < e && ((b[c++] = e & 255), (e >>= 8));
      b[c++] = e;
    }
    a = 4;
    void 0 === a && (a = 0);
    if (!Lc)
      for (
        Lc = {},
          c =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".split(
              ""
            ),
          d = ["+/=", "+/", "-_=", "-_.", "-_"],
          e = 0;
        5 > e;
        e++
      ) {
        var f = c.concat(d[e].split(""));
        Kc[e] = f;
        for (var g = 0; g < f.length; g++) {
          var h = f[g];
          void 0 === Lc[h] && (Lc[h] = g);
        }
      }
    a = Kc[a];
    c = Array(Math.floor(b.length / 3));
    d = a[64] || "";
    for (e = f = 0; f < b.length - 2; f += 3) {
      var l = b[f],
        n = b[f + 1];
      h = b[f + 2];
      g = a[l >> 2];
      l = a[((l & 3) << 4) | (n >> 4)];
      n = a[((n & 15) << 2) | (h >> 6)];
      h = a[h & 63];
      c[e++] = g + l + n + h;
    }
    g = 0;
    h = d;
    switch (b.length - f) {
      case 2:
        (g = b[f + 1]), (h = a[(g & 15) << 2] || d);
      case 1:
        (b = b[f]), (c[e] = a[b >> 2] + a[((b & 3) << 4) | (g >> 4)] + h + d);
    }
    return c.join("");
  }
  function Oc(a, b, c, d, e) {
    var f = Ib(c, "fmt");
    if (d) {
      var g = Ib(c, "random"),
        h = Ib(c, "label") || "";
      if (!g) return !1;
      g = Mc(
        decodeURIComponent(h.replace(/\+/g, " ")) +
          ":" +
          decodeURIComponent(g.replace(/\+/g, " "))
      );
      if (!Ic(a, g, d)) return !1;
    }
    f && 4 != f && (c = I(c, "rfmt", f));
    c = I(c, "fmt", 4);
    Fc(
      c,
      function () {
        a.google_noFurtherRedirects &&
          d &&
          d.call &&
          ((a.google_noFurtherRedirects = null), d());
      },
      e,
      b.getElementsByTagName("script")[0].parentElement || void 0
    );
    return !0;
  }
  var Pc = new (function (a, b) {
    this.g = a;
    this.defaultValue = void 0 === b ? !1 : b;
  })(1933);
  function Qc() {
    var a = {};
    this.g = function () {
      var b = Pc.g,
        c = Pc.defaultValue;
      return null != a[b] ? a[b] : c;
    };
  }
  var Rc = [];
  function Sc(a) {
    return void 0 == Rc[a] ? !1 : Rc[a];
  }
  var Tc = [],
    S = {},
    Uc = { ad_storage: !1, ad_user_data: !1, ad_personalization: !1 };
  function U() {
    var a = {};
    var b = Q.google_tag_data;
    Q.google_tag_data = void 0 === b ? a : b;
    a = Q.google_tag_data;
    a.ics ||
      (a.ics = {
        entries: {},
        cps: {},
        default: Vc,
        update: Wc,
        declare: Xc,
        implicit: Yc,
        addListener: Zc,
        notifyListeners: $c,
        setCps: ad,
        active: !1,
        usedDeclare: !1,
        usedDefault: !1,
        usedUpdate: !1,
        usedImplicit: !1,
        usedSetCps: !1,
        accessedDefault: !1,
        accessedAny: !1,
        wasSetLate: !1,
      });
    return a.ics;
  }
  function bd(a, b, c, d) {
    return "" === c || a === d ? !0 : a === c ? b !== d : !a && !b;
  }
  function Xc(a, b, c, d, e) {
    var f = U();
    f.active = !0;
    f.usedDeclare = !0;
    f = t(f, "entries");
    var g = f[a] || {},
      h = g.declare_region;
    c = c && vc(c) ? c.toUpperCase() : void 0;
    d = d.toUpperCase();
    e = e.toUpperCase();
    bd(c, h, d, e) &&
      ((b = {
        region: g.region,
        declare_region: c,
        declare: "granted" === b,
        implicit: g.implicit,
        default: g.default,
        update: g.update,
        quiet: g.quiet,
      }),
      "" !== d || !1 !== g.declare) &&
      (f[a] = b);
  }
  function Yc(a, b) {
    var c = U();
    c.active = !0;
    c.usedImplicit = !0;
    c = t(c, "entries");
    a = c[a] = c[a] || {};
    !1 !== a.implicit && (a.implicit = "granted" === b);
  }
  function Vc(a, b, c, d, e, f) {
    var g = U();
    g.usedDefault ||
      (!g.accessedDefault && !g.accessedAny) ||
      (g.wasSetLate = !0);
    g.active = !0;
    g.usedDefault = !0;
    P(19);
    if (void 0 == b) P(18);
    else {
      var h = t(g, "entries");
      g = h[a] || {};
      var l = g.region;
      c = c && vc(c) ? c.toUpperCase() : void 0;
      d = d.toUpperCase();
      e = e.toUpperCase();
      if (bd(c, l, d, e)) {
        e = !!(f && 0 < f && void 0 === g.update);
        var n = {
          region: c,
          declare_region: g.declare_region,
          implicit: g.implicit,
          default: "granted" === b,
          declare: g.declare,
          update: g.update,
          quiet: e,
        };
        if ("" !== d || !1 !== g.default) h[a] = n;
        e &&
          Q.setTimeout(function () {
            if (h[a] === n && n.quiet) {
              n.quiet = !1;
              var p = [a];
              if (Sc(4))
                for (var m in S) S.hasOwnProperty(m) && S[m] === a && p.push(m);
              for (m = 0; m < p.length; m++) cd(p[m]);
              $c();
              P(2);
            }
          }, f);
      }
    }
  }
  function Wc(a, b) {
    var c = U();
    c.usedDefault || c.usedUpdate || !c.accessedAny || (c.wasSetLate = !0);
    c.active = !0;
    c.usedUpdate = !0;
    if (void 0 != b) {
      var d = dd(c, a),
        e = t(c, "entries");
      e = e[a] = e[a] || {};
      e.update = "granted" === b;
      c = dd(c, a);
      b = [a];
      if (Sc(4))
        for (var f in S) S.hasOwnProperty(f) && S[f] === a && b.push(f);
      if (e.quiet) for (e.quiet = !1, a = 0; a < b.length; a++) cd(b[a]);
      else if (c !== d) for (a = 0; a < b.length; a++) cd(b[a]);
    }
  }
  function ad(a, b, c, d, e) {
    var f = U();
    a: {
      var g = f.cps,
        h = g[a] || {},
        l = h.region;
      c = c && vc(c) ? c.toUpperCase() : void 0;
      d = d.toUpperCase();
      if (
        bd(c, l, d, e.toUpperCase()) &&
        ((b = { enabled: "granted" === b, region: c }),
        "" !== d || !1 !== h.enabled)
      ) {
        g[a] = b;
        a = !0;
        break a;
      }
      a = !1;
    }
    a && (f.usedSetCps = !0);
  }
  function Zc(a, b) {
    Tc.push({ consentTypes: a, C: b });
  }
  function cd(a) {
    for (var b = 0; b < Tc.length; ++b) {
      var c = Tc[b];
      wc(c.consentTypes) && -1 !== c.consentTypes.indexOf(a) && (c.B = !0);
    }
  }
  function $c(a, b) {
    for (var c = 0; c < Tc.length; ++c) {
      var d = Tc[c];
      if (d.B) {
        d.B = !1;
        try {
          d.C({ consentEventId: a, consentPriorityId: b });
        } catch (e) {}
      }
    }
  }
  function dd(a, b) {
    var c = t(a, "entries");
    a = c[b] || {};
    var d = a.update;
    if (void 0 !== d) return d ? 1 : 2;
    d = a.default;
    if (void 0 !== d) return d ? 1 : 2;
    if (Sc(4) && S.hasOwnProperty(b)) {
      c = c[S[b]] || {};
      d = c.update;
      if (void 0 !== d) return d ? 1 : 2;
      d = c.default;
      if (void 0 !== d) return d ? 1 : 2;
    }
    d = a.declare;
    return void 0 !== d
      ? d
        ? 1
        : 2
      : Sc(4) && ((d = a.implicit), void 0 !== d)
      ? d
        ? 3
        : 4
      : Sc(3) && Uc.hasOwnProperty(b)
      ? Uc[b]
        ? 3
        : 4
      : 0;
  }
  function ed(a) {
    var b = U();
    b.accessedAny = !0;
    switch (dd(b, a)) {
      case 1:
      case 3:
        return !0;
      case 2:
      case 4:
        return !1;
      default:
        return !0;
    }
  }
  function fd(a) {
    var b = U();
    b.accessedAny = !0;
    return !(t(b, "entries")[a] || {}).quiet;
  }
  function gd() {
    if (!O(Qc).g()) return !1;
    var a = U();
    a.accessedAny = !0;
    return a.active;
  }
  function hd(a, b) {
    U().addListener(a, b);
  }
  function id(a) {
    function b() {
      for (var e = 0; e < c.length; e++) if (!fd(c[e])) return !0;
      return !1;
    }
    var c = ["ad_storage"];
    if (b()) {
      var d = !1;
      hd(c, function (e) {
        d || b() || ((d = !0), a(e));
      });
    } else a({});
  }
  function jd(a) {
    function b() {
      for (var e = [], f = 0; f < c.length; f++) {
        var g = c[f];
        ed(g) && !d[g] && (e.push(g), (d[g] = !0));
      }
      return e;
    }
    var c = vc("ad_storage") ? ["ad_storage"] : "ad_storage",
      d = {};
    b().length !== c.length &&
      hd(c, function (e) {
        var f = b();
        0 < f.length && ((e.consentTypes = f), a(e));
      });
  }
  function kd(a, b, c, d) {
    if (ld(d)) {
      d = [];
      b = String(b || md()).split(";");
      for (var e = 0; e < b.length; e++) {
        var f = b[e].split("="),
          g = f[0].replace(/^\s*|\s*$/g, "");
        g &&
          g == a &&
          ((f = f
            .slice(1)
            .join("=")
            .replace(/^\s*|\s*$/g, "")) &&
            c &&
            (f = decodeURIComponent(f)),
          d.push(f));
      }
      a = d;
    } else a = [];
    return a;
  }
  function nd(a, b, c, d) {
    var e = md(),
      f = window;
    "null" !== f.origin && (f.document.cookie = a);
    a = md();
    return e != a || (void 0 != c && 0 <= kd(b, a, !1, d).indexOf(c));
  }
  function od(a, b, c) {
    function d(m, q, H) {
      if (null == H) return delete g[q], m;
      g[q] = H;
      return m + "; " + q + "=" + H;
    }
    function e(m, q) {
      if (null == q) return delete g[q], m;
      g[q] = !0;
      return m + "; " + q;
    }
    if (ld(c.l)) {
      if (void 0 == b)
        var f = a + "=deleted; expires=" + new Date(0).toUTCString();
      else
        c.encode && (b = encodeURIComponent(b)), (b = pd(b)), (f = a + "=" + b);
      var g = {};
      f = d(f, "path", c.path);
      if (c.expires instanceof Date) var h = c.expires.toUTCString();
      else null != c.expires && (h = c.expires);
      f = d(f, "expires", h);
      f = d(f, "max-age", c.Z);
      f = d(f, "samesite", c.aa);
      c.ba && (f = e(f, "secure"));
      if ((h = c.domain) && "auto" === h.toLowerCase()) {
        h = qd();
        for (var l = 0; l < h.length; ++l) {
          var n = "none" !== h[l] ? h[l] : void 0,
            p = d(f, "domain", n);
          p = e(p, c.flags);
          if (!rd(n, c.path) && nd(p, a, b, c.l)) break;
        }
      } else
        h && "none" !== h.toLowerCase() && (f = d(f, "domain", h)),
          (f = e(f, c.flags)),
          rd(h, c.path) || nd(f, a, b, c.l);
    }
  }
  function sd(a, b, c) {
    null == c.path && (c.path = "/");
    c.domain || (c.domain = "auto");
    od(a, b, c);
  }
  function pd(a) {
    a && 1200 < a.length && (a = a.substring(0, 1200));
    return a;
  }
  var td = /^(www\.)?google(\.com?)?(\.[a-z]{2})?$/,
    ud = /(^|\.)doubleclick\.net$/i;
  function rd(a, b) {
    return (
      ud.test(window.document.location.hostname) || ("/" === b && td.test(a))
    );
  }
  function md() {
    return "null" !== window.origin ? window.document.cookie : "";
  }
  function qd() {
    var a = [],
      b = window.document.location.hostname.split(".");
    if (4 === b.length) {
      var c = b[b.length - 1];
      if (parseInt(c, 10).toString() === c) return ["none"];
    }
    for (c = b.length - 2; 0 <= c; c--) a.push(b.slice(c).join("."));
    b = window.document.location.hostname;
    ud.test(b) || td.test(b) || a.push("none");
    return a;
  }
  function ld(a) {
    return O(Qc).g() && a && gd() ? (fd(a) ? ed(a) : !1) : !0;
  }
  function vd(a, b) {
    var c,
      d = Number(null != a.A ? a.A : void 0);
    0 !== d &&
      (c = new Date(
        (b || new Date(Date.now()).getTime()) + 1e3 * (d || 7776e3)
      ));
    return {
      path: a.path,
      domain: a.domain,
      flags: a.flags,
      encode: !0,
      expires: c,
      l: void 0,
    };
  }
  function wd(a) {
    var b = [],
      c = R.cookie.split(";");
    a = new RegExp("^\\s*" + (a || "_gac") + "_(UA-\\d+-\\d+)=\\s*(.+?)\\s*$");
    for (var d = 0; d < c.length; d++) {
      var e = c[d].match(a);
      e &&
        b.push({
          v: e[1],
          value: e[2],
          timestamp: Number(e[2].split(".")[1]) || 0,
        });
    }
    b.sort(function (f, g) {
      return g.timestamp - f.timestamp;
    });
    return b;
  }
  function xd(a, b) {
    a = wd(a);
    var c = {};
    if (!a || !a.length) return c;
    for (var d = 0; d < a.length; d++) {
      var e = a[d].value.split(".");
      if (
        !("1" !== e[0] || (b && 3 > e.length) || (!b && 3 !== e.length)) &&
        Number(e[1])
      ) {
        c[a[d].v] || (c[a[d].v] = []);
        var f = { version: e[0], timestamp: 1e3 * Number(e[1]), i: e[2] };
        b && 3 < e.length && (f.labels = e.slice(3));
        c[a[d].v].push(f);
      }
    }
    return c;
  }
  var yd = /:[0-9]+$/;
  function zd(a, b) {
    a = a.split("&");
    for (var c = 0; c < a.length; c++) {
      var d = a[c].split("=");
      if (decodeURIComponent(d[0]).replace(/\+/g, " ") === b)
        return decodeURIComponent(d.slice(1).join("=")).replace(/\+/g, " ");
    }
  }
  function Ad(a, b) {
    var c = "query";
    var d = (d = a.protocol) ? d.replace(":", "").toLowerCase() : "";
    c && (c = String(c).toLowerCase());
    switch (c) {
      case "url_no_fragment":
        b = "";
        a &&
          a.href &&
          ((b = a.href.indexOf("#")),
          (b = 0 > b ? a.href : a.href.substr(0, b)));
        a = b;
        break;
      case "protocol":
        a = d;
        break;
      case "host":
        a = a.hostname.replace(yd, "").toLowerCase();
        break;
      case "port":
        a = String(
          Number(a.port) || ("http" === d ? 80 : "https" === d ? 443 : "")
        );
        break;
      case "path":
        a.pathname || a.hostname || P(1);
        a = "/" === a.pathname.charAt(0) ? a.pathname : "/" + a.pathname;
        a = a.split("/");
        0 <= [].indexOf(a[a.length - 1]) && (a[a.length - 1] = "");
        a = a.join("/");
        break;
      case "query":
        a = a.search.replace("?", "");
        b && (a = zd(a, b));
        break;
      case "extension":
        a = a.pathname.split(".");
        a = 1 < a.length ? a[a.length - 1] : "";
        a = a.split("/")[0];
        break;
      case "fragment":
        a = a.hash.replace("#", "");
        break;
      default:
        a = a && a.href;
    }
    return a;
  }
  var Bd = /^\w+$/,
    Cd = /^[\w-]+$/,
    Dd = { aw: "_aw", dc: "_dc", gf: "_gf", ha: "_ha", gp: "_gp", gb: "_gb" };
  function V() {
    return O(Qc).g() && gd() ? ed("ad_storage") : !0;
  }
  function Ed(a, b) {
    fd("ad_storage")
      ? V()
        ? a()
        : jd(a)
      : b
      ? P(3)
      : id(function () {
          Ed(a, !0);
        });
  }
  function Fd(a) {
    return Gd(a).map(function (b) {
      return b.i;
    });
  }
  function Gd(a) {
    var b = [];
    if ("null" === Q.origin || !R.cookie) return b;
    a = kd(a, R.cookie, void 0, "ad_storage");
    if (!a || 0 == a.length) return b;
    for (var c = {}, d = 0; d < a.length; c = { m: c.m }, d++) {
      var e = Hd(a[d]);
      if (null != e) {
        var f = e;
        e = f.version;
        c.m = f.i;
        var g = f.timestamp;
        f = f.labels;
        var h = xc(
          b,
          (function (l) {
            return function (n) {
              return n.i === l.m;
            };
          })(c)
        );
        h
          ? ((h.timestamp = Math.max(h.timestamp, g)),
            (h.labels = Id(h.labels, f || [])))
          : b.push({ version: e, i: c.m, timestamp: g, labels: f });
      }
    }
    b.sort(function (l, n) {
      return n.timestamp - l.timestamp;
    });
    return Jd(b);
  }
  function Id(a, b) {
    for (var c = {}, d = [], e = 0; e < a.length; e++)
      (c[a[e]] = !0), d.push(a[e]);
    for (a = 0; a < b.length; a++) c[b[a]] || d.push(b[a]);
    return d;
  }
  function Kd(a) {
    return a && "string" == typeof a && a.match(Bd) ? a : "_gcl";
  }
  function Ld() {
    var a = Q.location.href,
      b = R.createElement("a");
    a && (b.href = a);
    var c = b.pathname;
    "/" !== c[0] && (a || P(1), (c = "/" + c));
    a = b.hostname.replace(yd, "");
    var d = {
      href: b.href,
      protocol: b.protocol,
      host: b.host,
      hostname: a,
      pathname: c,
      search: b.search,
      hash: b.hash,
      port: b.port,
    };
    b = Ad(d, "gclid");
    c = Ad(d, "gclsrc");
    a = Ad(d, "wbraid");
    var e = Ad(d, "dclid");
    (b && c && a) ||
      ((d = d.hash.replace("#", "")),
      (b = b || zd(d, "gclid")),
      (c = c || zd(d, "gclsrc")),
      (a = a || zd(d, "wbraid")));
    return Md(b, c, e, a);
  }
  function Md(a, b, c, d) {
    function e(g, h) {
      f[h] || (f[h] = []);
      f[h].push(g);
    }
    var f = {};
    f.gclid = a;
    f.gclsrc = b;
    f.dclid = c;
    void 0 !== d && Cd.test(d) && ((f.gbraid = d), e(d, "gb"));
    if (void 0 !== a && a.match(Cd))
      switch (b) {
        case void 0:
          e(a, "aw");
          break;
        case "aw.ds":
          e(a, "aw");
          e(a, "dc");
          break;
        case "ds":
          e(a, "dc");
          break;
        case "3p.ds":
          e(a, "dc");
          break;
        case "gf":
          e(a, "gf");
          break;
        case "ha":
          e(a, "ha");
      }
    c && e(c, "dc");
    return f;
  }
  function Nd() {
    var a = {},
      b = Ld();
    Ed(function () {
      Od(b, !1, a);
    });
  }
  function Od(a, b, c, d, e) {
    function f(m) {
      m = ["GCL", p, m];
      0 < e.length && m.push(e.join("."));
      return m.join(".");
    }
    function g(m, q) {
      if ((m = Pd(m, h))) sd(m, q, l), (n = !0);
    }
    c = c || {};
    e = e || [];
    var h = Kd(c.prefix);
    d = d || new Date(Date.now()).getTime();
    var l = vd(c, d);
    l.l = "ad_storage";
    var n = !1,
      p = Math.round(d / 1e3);
    a.aw && g("aw", f(a.aw[0]));
    a.dc && g("dc", f(a.dc[0]));
    a.gf && g("gf", f(a.gf[0]));
    a.ha && g("ha", f(a.ha[0]));
    a.gp && g("gp", f(a.gp[0]));
    if (!n && a.gb) {
      a = a.gb[0];
      d = Pd("gb", h);
      c = !1;
      if (!b)
        for (b = Gd(d), d = 0; d < b.length; d++)
          b[d].i === a && b[d].labels && 0 < b[d].labels.length && (c = !0);
      c || g("gb", f(a));
    }
  }
  function Pd(a, b) {
    a = Dd[a];
    if (void 0 !== a) return b + a;
  }
  function Qd(a) {
    return 0 !== Rd(a.split(".")).length
      ? 1e3 * (Number(a.split(".")[1]) || 0)
      : 0;
  }
  function Hd(a) {
    a = Rd(a.split("."));
    return 0 === a.length
      ? null
      : {
          version: a[0],
          i: a[2],
          timestamp: 1e3 * (Number(a[1]) || 0),
          labels: a.slice(3),
        };
  }
  function Rd(a) {
    return 3 > a.length ||
      ("GCL" !== a[0] && "1" !== a[0]) ||
      !/^\d+$/.test(a[1]) ||
      !Cd.test(a[2])
      ? []
      : a;
  }
  function Jd(a) {
    return a.filter(function (b) {
      return Cd.test(b.i);
    });
  }
  function Sd() {
    var a = ["aw"],
      b = {};
    if ("null" !== Q.origin) {
      for (var c = Kd(b.prefix), d = {}, e = 0; e < a.length; e++)
        Dd[a[e]] && (d[a[e]] = Dd[a[e]]);
      Ed(function () {
        yc(d, function (f, g) {
          g = kd(c + g, R.cookie, void 0, "ad_storage");
          g.sort(function (p, m) {
            return Qd(m) - Qd(p);
          });
          if (g.length) {
            var h = g[0];
            g = Qd(h);
            var l = 0 !== Rd(h.split(".")).length ? h.split(".").slice(3) : [],
              n = {};
            h = 0 !== Rd(h.split(".")).length ? h.split(".")[2] : void 0;
            n[f] = [h];
            Od(n, !0, b, g, l);
          }
        });
      });
    }
  }
  function Td(a, b, c, d) {
    var e = [];
    c = c || {};
    if (!V()) return e;
    var f = Gd(a);
    if (!f.length) return e;
    for (var g = 0; g < f.length; g++)
      -1 === (f[g].labels || []).indexOf(b) ? e.push(0) : e.push(1);
    if (d) return e;
    1 !== e[0] &&
      ((d = f[0]),
      (f = f[0].timestamp),
      (b = [d.version, Math.round(f / 1e3), d.i]
        .concat(d.labels || [], [b])
        .join(".")),
      (c = vd(c, f)),
      (c.l = "ad_storage"),
      sd(a, b, c));
    return e;
  }
  function Ud(a, b) {
    b = Kd(b);
    a = Pd(a, b);
    if (!a) return 0;
    a = Gd(a);
    for (var c = (b = 0); c < a.length; c++) b = Math.max(b, a[c].timestamp);
    return b;
  }
  function Vd(a) {
    var b = 0,
      c;
    for (c in a)
      for (var d = a[c], e = 0; e < d.length; e++)
        b = Math.max(b, Number(d[e].timestamp));
    return b;
  }
  var Wd = RegExp(
      "^UA-\\d+-\\d+%3A[\\w-]+(?:%2C[\\w-]+)*(?:%3BUA-\\d+-\\d+%3A[\\w-]+(?:%2C[\\w-]+)*)*$"
    ),
    Xd = /^~?[\w-]+(?:\.~?[\w-]+)*$/,
    Yd = /^\d+\.fls\.doubleclick\.net$/,
    Zd = /;gac=([^;?]+)/,
    $d = /;gacgb=([^;?]+)/,
    ae = /;gclaw=([^;?]+)/,
    be = /;gclgb=([^;?]+)/;
  function ce(a, b, c) {
    if (Yd.test(a.location.host))
      return (b = a.location.href.match(c)) && 2 == b.length && b[1].match(Wd)
        ? decodeURIComponent(b[1])
        : "";
    a = [];
    for (var d in b) {
      c = [];
      for (var e = b[d], f = 0; f < e.length; f++) c.push(e[f].i);
      a.push(d + ":" + c.join(","));
    }
    return 0 < a.length ? a.join(";") : "";
  }
  function de(a, b, c, d) {
    var e = V() ? xd("_gac_gb", !0) : {},
      f = [],
      g = !1,
      h;
    for (h in e) {
      var l = Td("_gac_gb_" + h, b, c, d);
      g =
        g ||
        (0 !== l.length &&
          l.some(function (n) {
            return 1 === n;
          }));
      f.push(h + ":" + l.join(","));
    }
    return { F: g ? f.join(";") : "", D: ce(a, e, $d) };
  }
  function ee(a, b, c, d) {
    if (Yd.test(a.location.host)) {
      if ((a = a.location.href.match(d)) && 2 == a.length && a[1].match(Xd))
        return [{ i: a[1] }];
    } else return Gd((b || "_gcl") + c);
    return [];
  }
  function fe(a, b) {
    return ee(a, b, "_aw", ae)
      .map(function (c) {
        return c.i;
      })
      .join(".");
  }
  function ge(a, b) {
    return ee(a, b, "_gb", be)
      .map(function (c) {
        return c.i;
      })
      .join(".");
  }
  function he(a) {
    0 !== Fd("_gcl_aw").length ||
      (a && 0 !== Fd(a + "_aw").length) ||
      (Nd(), Sd());
  }
  function ie(a, b, c) {
    a = Td(((b && b.prefix) || "_gcl") + "_gb", a, b, c);
    return 0 === a.length ||
      a.every(function (d) {
        return 0 === d;
      })
      ? ""
      : a.join(".");
  }
  function je() {
    if ("function" === typeof Q.__uspapi) {
      var a = "";
      try {
        Q.__uspapi("getUSPData", 1, function (b, c) {
          c &&
            b &&
            (b = b.uspString) &&
            RegExp("^[\\da-zA-Z-]{1,20}$").test(b) &&
            (a = b);
        });
      } catch (b) {}
      return a;
    }
  }
  var ke =
    "platform platformVersion architecture model uaFullVersion bitness fullVersionList wow64".split(
      " "
    );
  function le(a) {
    var b;
    return null != (b = a.google_tag_data) ? b : (a.google_tag_data = {});
  }
  function me(a) {
    a = a.google_tag_data;
    if (null != a && a.uach) {
      a = a.uach;
      var b = t(Object, "assign").call(Object, {}, a);
      a.fullVersionList && (b.fullVersionList = a.fullVersionList.slice(0));
      a = b;
    } else a = null;
    return a;
  }
  function ne(a) {
    var b, c;
    return (
      "function" ===
      typeof (null == (b = a.navigator)
        ? void 0
        : null == (c = b.userAgentData)
        ? void 0
        : c.getHighEntropyValues)
    );
  }
  function oe() {
    var a = window;
    if (ne(a)) {
      var b = le(a);
      b.uach_promise ||
        ((a = a.navigator.userAgentData
          .getHighEntropyValues(ke)
          .then(function (c) {
            null != b.uach || (b.uach = c);
            return c;
          })),
        (b.uach_promise = a));
    }
  }
  var pe = /^[a-zA-Z0-9_]+$/,
    qe = !1,
    re =
      "google_conversion_id google_conversion_format google_conversion_type google_conversion_order_id google_conversion_language google_conversion_value google_conversion_currency google_conversion_domain google_conversion_label google_conversion_color google_disable_viewthrough google_enable_display_cookie_match google_gtag_event_data google_remarketing_only google_conversion_linker google_tag_for_child_directed_treatment google_tag_for_under_age_of_consent google_allow_ad_personalization_signals google_restricted_data_processing google_conversion_items google_conversion_merchant_id google_user_id google_custom_params google_conversion_date google_conversion_time google_conversion_js_version onload_callback opt_image_generator google_gtm_url_processor google_conversion_page_url google_conversion_referrer_url google_gtm google_gcl_cookie_prefix google_gcl_cookie_path google_gcl_cookie_flags google_gcl_cookie_domain google_gcl_cookie_max_age_seconds google_read_gcl_cookie_opt_out google_basket_feed_country google_basket_feed_language google_basket_discount google_basket_transaction_type google_additional_conversion_params google_additional_params google_transport_url google_gtm_experiments".split(
        " "
      ),
    se = ["google_conversion_first_time", "google_conversion_snippets"];
  function W(a) {
    return null != a ? encodeURIComponent(String(a)) : "";
  }
  function te(a) {
    if (null != a) {
      a = String(a).substring(0, 512);
      var b = a.indexOf("#");
      return -1 == b ? a : a.substring(0, b);
    }
    return "";
  }
  function X(a, b) {
    b = W(b);
    return "" != b && ((a = W(a)), "" != a) ? "&".concat(a, "=", b) : "";
  }
  function ue(a) {
    var b = typeof a;
    return null == a || "object" == b || "function" == b
      ? null
      : String(a)
          .replace(/,/g, "\\,")
          .replace(/;/g, "\\;")
          .replace(/=/g, "\\=");
  }
  function ve(a) {
    if (!a || "object" != typeof a || "function" == typeof a.join) return "";
    var b = [],
      c;
    for (c in a)
      if (Object.prototype.hasOwnProperty.call(a, c)) {
        var d = a[c];
        if (d && "function" === typeof d.join) {
          for (var e = [], f = 0; f < d.length; ++f) {
            var g = ue(d[f]);
            null != g && e.push(g);
          }
          d = 0 == e.length ? null : e.join(",");
        } else d = ue(d);
        (e = ue(c)) && null != d && b.push(e + "=" + d);
      }
    return b.join(";");
  }
  function we(a) {
    return "number" != typeof a && "string" != typeof a ? "" : W(a.toString());
  }
  function xe(a, b) {
    if (
      b.google_read_gcl_cookie_opt_out ||
      b.google_remarketing_only ||
      (b.google_conversion_domain &&
        (!b.google_gcl_cookie_prefix ||
          !/^_ycl/.test(b.google_gcl_cookie_prefix)))
    )
      return "";
    var c = "";
    var d =
      b.google_gcl_cookie_prefix &&
      "_gcl" !== b.google_gcl_cookie_prefix &&
      pe.test(b.google_gcl_cookie_prefix)
        ? b.google_gcl_cookie_prefix
        : "";
    var e = {};
    b.google_gcl_cookie_domain && (e.domain = b.google_gcl_cookie_domain);
    b.google_gcl_cookie_flags && (e.flags = b.google_gcl_cookie_flags);
    null != b.google_gcl_cookie_max_age_seconds &&
      (e.A = b.google_gcl_cookie_max_age_seconds);
    b.google_gcl_cookie_path && (e.path = b.google_gcl_cookie_path);
    d && (e.prefix = d);
    if (ye(b) && b.s) var f = void 0 === b.o;
    else
      Yd.test(a.location.host)
        ? (f = !(ae.test(a.location.href) || Zd.test(a.location.href)))
        : ((f = Math.max(Ud("aw", d), Vd(V() ? xd() : {}))),
          (f = Math.max(Ud("gb", d), Vd(V() ? xd("_gac_gb", !0) : {})) > f));
    if (f) {
      if (void 0 !== b.o) return b.o;
      c = ge(a, d || void 0);
      f = b.google_conversion_label;
      var g = ie(f, e, b.s);
      c = X("gclgb", c) + (g ? X("mcov", g) : "");
      if (d) return (b.o = c);
      d = de(a, f, e, b.s);
      a = d.D;
      d = d.F;
      c += (a ? X("gacgb", a) : "") + (d ? X("gacmcov", d) : "");
      return (b.o = c);
    }
    if (d) return (b = fe(a, d)), X("gclaw", b);
    (b = fe(a)) && (c = X("gclaw", b));
    b = ce(a, V() ? xd() : {}, Zd);
    return c + (b ? X("gac", b) : "");
  }
  function ze(a) {
    function b(d) {
      try {
        return decodeURIComponent(d), !0;
      } catch (e) {
        return !1;
      }
    }
    a = a ? a.title : "";
    if (void 0 == a || "" == a) return "";
    a = encodeURIComponent(a);
    for (var c = 256; !b(a.substr(0, c)); ) c--;
    return "&tiba=" + a.substr(0, c);
  }
  function Ae(a, b, c, d, e) {
    var f = "https://",
      g = "landing" === d.google_conversion_type ? "/extclk" : "/";
    switch (e) {
      default:
        return "";
      case 2:
      case 3:
        var h = "googleads.g.doubleclick.net/";
        var l = "pagead/viewthroughconversion/";
        break;
      case 1:
        h = "www.google.com/";
        l = "pagead/1p-conversion/";
        break;
      case 6:
        h = "www.google.com/";
        l = "ccm/conversion/";
        break;
      case 0:
        h = d.google_conversion_domain || "www.googleadservices.com/";
        l = "pagead/conversion/";
        break;
      case 5:
        h = d.google_conversion_domain || "www.googleadservices.com/";
        l = "ccm/conversion/";
        break;
      case 4:
        h =
          (h = d.google_gtm_experiments) && h.apcm
            ? "www.google.com"
            : h && h.capiorig
            ? d.google_conversion_id + ".privacysandbox.googleadservices.com"
            : "www.google.com/";
        l = "pagead/privacysandbox/conversion/";
        break;
      case 7:
        (h = "googleads.g.doubleclick.net/"), (l = "td/rul/");
    }
    $b && d.google_transport_url && (h = d.google_transport_url);
    "/" !== h[h.length - 1] && (h += "/");
    if (0 === h.indexOf("http://") || 0 === h.indexOf("https://")) f = "";
    f = [
      f,
      h,
      l,
      W(d.google_conversion_id),
      g,
      "?random=",
      W(d.google_conversion_time),
    ].join("");
    g = X("cv", d.google_conversion_js_version);
    h = X("fst", d.google_conversion_first_time);
    l = X("num", d.google_conversion_snippets);
    var n = X("fmt", d.google_conversion_format),
      p = d.google_remarketing_only ? X("userId", d.google_user_id) : "";
    var m = d.google_tag_for_child_directed_treatment;
    m = null == m || (0 !== m && 1 !== m) ? "" : X("tfcd", m);
    var q = d.google_tag_for_under_age_of_consent;
    q = null == q || (0 !== q && 1 !== q) ? "" : X("tfua", q);
    var H = d.google_allow_ad_personalization_signals;
    H = !1 === H ? X("npa", 1) : !0 === H ? X("npa", 0) : "";
    var Ha = d.google_restricted_data_processing;
    Ha = bc ? (!0 === Ha ? X("rdp", 1) : !1 === Ha ? X("rdp", 0) : "") : "";
    var Me = X("value", d.google_conversion_value),
      Ne = X("currency_code", d.google_conversion_currency),
      Oe = X("label", d.google_conversion_label),
      Pe = X("oid", d.google_conversion_order_id),
      Qe = X("bg", d.google_conversion_color);
    a: {
      var B = d.google_conversion_language;
      if (null != B) {
        B = B.toString();
        if (2 == B.length) {
          B = X("hl", B);
          break a;
        }
        if (5 == B.length) {
          B = X("hl", B.substring(0, 2)) + X("gl", B.substring(3, 5));
          break a;
        }
      }
      B = "";
    }
    var Re = X("guid", "ON"),
      Se =
        !d.google_conversion_domain &&
        "GooglemKTybQhCsO" in v &&
        "function" == typeof v.GooglemKTybQhCsO
          ? X("resp", "GooglemKTybQhCsO")
          : "",
      Te = X("disvt", d.google_disable_viewthrough),
      Ue = X("eid", hc().join());
    var ma = d.google_conversion_date;
    var z = [];
    if (a) {
      var L = a.screen;
      L &&
        (z.push(X("u_h", L.height)),
        z.push(X("u_w", L.width)),
        z.push(X("u_ah", L.availHeight)),
        z.push(X("u_aw", L.availWidth)),
        z.push(X("u_cd", L.colorDepth)));
      a.history && z.push(X("u_his", a.history.length));
    }
    ma &&
      "function" == typeof ma.getTimezoneOffset &&
      z.push(X("u_tz", -ma.getTimezoneOffset()));
    b &&
      ("function" == typeof b.javaEnabled &&
        z.push(X("u_java", b.javaEnabled())),
      b.plugins && z.push(X("u_nplug", b.plugins.length)),
      b.mimeTypes && z.push(X("u_nmime", b.mimeTypes.length)));
    ma = z.join("");
    z = X("gtm", d.google_gtm);
    b = b && b.sendBeacon ? X("sendb", "1") : "";
    L = Be();
    var We = X(
      "ig",
      /googleadservices\.com/.test("www.googleadservices.com") ? 1 : 0
    );
    var T = ve(d.google_custom_params);
    var Ia = ve();
    T = T.concat(0 < T.length && 0 < Ia.length ? ";" : "", Ia);
    T = "" == T ? "" : "&".concat("data=", encodeURIComponent(T));
    Ia = xe(c, d);
    var na = d.google_conversion_page_url,
      Xe = d.google_conversion_referrer_url,
      oa = "";
    if (c) {
      var aa =
        a.top == a
          ? 0
          : (aa = a.location.ancestorOrigins)
          ? aa[aa.length - 1] == a.location.origin
            ? 1
            : 2
          : Mb(a.top)
          ? 1
          : 2;
      na = na ? na : 1 == aa ? a.top.location.href : a.location.href;
      var Nc = "";
      M && K(["509562772", "509562773"], Xb, 21);
      if (M && ("509562773" == N(21) || "509562772" == N(21))) {
        for (var x, r = a, ba = r; r && r != r.parent; )
          (r = r.parent), Mb(r) && (ba = r);
        x = ba;
        r = x.location.href;
        if (x === x.top) r = { url: r, H: !0 };
        else {
          ba = !1;
          var rb = x.document;
          rb &&
            rb.referrer &&
            ((r = rb.referrer), x.parent === x.top && (ba = !0));
          (x = x.location.ancestorOrigins) &&
            (x = x[x.length - 1]) &&
            -1 === r.indexOf(x) &&
            ((ba = !1), (r = x));
          r = { url: r, H: ba };
        }
        r.url && na !== r.url && (Nc = r.url);
      }
      oa += X("frm", aa);
      oa += X("url", te(na));
      oa += X("ref", te(Xe || c.referrer));
      oa += X("top", te(Nc));
    }
    a = [
      g,
      h,
      l,
      n,
      p,
      m,
      q,
      H,
      Ha,
      Me,
      Ne,
      Oe,
      Pe,
      Qe,
      B,
      Re,
      Se,
      Te,
      Ue,
      ma,
      z,
      b,
      L,
      We,
      T,
      Ia,
      oa,
      ze(c),
      Ce(d.google_additional_params),
      Ce(
        d.google_remarketing_only ? {} : d.google_additional_conversion_params
      ),
      "&hn=" + W("www.googleadservices.com"),
      De(a),
      Ee(a),
    ].join("");
    c = gc();
    a += 0 < c.length ? "&debug_experiment_id=" + c : "";
    if (!d.google_remarketing_only && !d.google_conversion_domain) {
      c = [
        X("mid", d.google_conversion_merchant_id),
        X("fcntr", d.google_basket_feed_country),
        X("flng", d.google_basket_feed_language),
        X("dscnt", d.google_basket_discount),
        X("bttype", d.google_basket_transaction_type),
      ].join("");
      if (d)
        if ((g = d.google_conversion_items)) {
          h = [];
          l = 0;
          for (n = g.length; l < n; l++)
            (p = g[l]),
              (m = []),
              p &&
                (m.push(we(p.value)),
                m.push(we(p.quantity)),
                m.push(we(p.item_id)),
                m.push(we(p.start_date)),
                m.push(we(p.end_date)),
                h.push("(" + m.join("*") + ")"));
          g = 0 < h.length ? "&item=" + h.join("") : "";
        } else g = "";
      else g = "";
      c = [a, c, g].join("");
      a = 4e3 < c.length ? [a, X("item", "elngth")].join("") : c;
    }
    f += a;
    1 === e || 6 === e
      ? (f += [X("gcp", 1), X("sscte", 1), X("ct_cookie_present", 1)].join(""))
      : 3 == e && ((f += X("gcp", 1)), (f += X("ct_cookie_present", 1)));
    ac && ((e = je()), void 0 !== e && (f += X("us_privacy", e || "error")));
    ye(d) && (f = d.s ? f + X("gbcov", 1) : f + X("gbcov", 0));
    return f;
  }
  function Fe(a, b, c, d, e, f, g) {
    return (
      '<iframe name="' +
      a +
      '"' +
      (g ? ' id="' + g + '"' : "") +
      ' title="' +
      b +
      '" width="' +
      d +
      '" height="' +
      e +
      '"' +
      (c ? ' src="' + c + '"' : "") +
      ' frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true"' +
      (f ? ' style="display:none"' : "") +
      ' scrolling="no"></iframe>'
    );
  }
  function Ge(a) {
    return {
      ar: 1,
      bg: 1,
      cs: 1,
      da: 1,
      de: 1,
      el: 1,
      en_AU: 1,
      en_US: 1,
      en_GB: 1,
      es: 1,
      et: 1,
      fi: 1,
      fr: 1,
      hi: 1,
      hr: 1,
      hu: 1,
      id: 1,
      is: 1,
      it: 1,
      iw: 1,
      ja: 1,
      ko: 1,
      lt: 1,
      nl: 1,
      no: 1,
      pl: 1,
      pt_BR: 1,
      pt_PT: 1,
      ro: 1,
      ru: 1,
      sk: 1,
      sl: 1,
      sr: 1,
      sv: 1,
      th: 1,
      tl: 1,
      tr: 1,
      vi: 1,
      zh_CN: 1,
      zh_TW: 1,
    }[a]
      ? a + ".html"
      : "en_US.html";
  }
  function He(a, b, c, d) {
    function e(h, l, n, p, m) {
      p = p ? ' style="display:none"' : "";
      return (
        "<img " +
        (m && lc() ? "attributionsrc " : "") +
        'height="' +
        n +
        '" width="' +
        l +
        '" border="0" alt="" src="' +
        h +
        '"' +
        p +
        " />"
      );
    }
    kc() && qc(2);
    var f = "";
    d.google_remarketing_only &&
      d.google_enable_display_cookie_match &&
      !tc &&
      (M && K(["376635470", "376635471"], Ub, 2),
      (f =
        d.google_remarketing_only &&
        d.google_enable_display_cookie_match &&
        !tc &&
        M &&
        "376635471" == N(2)
          ? Fe(
              "google_cookie_match_frame",
              "Google cookie match frame",
              "https://bid.g.doubleclick.net/xbbe/pixel?d=KAE",
              1,
              1,
              !0,
              null
            )
          : ""));
    d.google_remarketing_only &&
      !d.google_conversion_domain &&
      M &&
      K(["759238990", "759238991"], Zb, 13);
    !d.google_remarketing_only ||
      d.google_conversion_domain ||
      (M && ("759248991" == N(14) || "759248990" == N(14))) ||
      (M && K(["759248990", "759248991"], Yb, 14));
    !1 !== d.google_conversion_linker && he(d.google_gcl_cookie_prefix);
    b = Ae(a, b, c, d, d.google_remarketing_only ? 2 : 0);
    if (0 == d.google_conversion_format && null == d.google_conversion_domain)
      return (
        '<a href="https://services.google.com/sitestats/' +
        (Ge(d.google_conversion_language) +
          "?cid=" +
          W(d.google_conversion_id)) +
        '" target="_blank">' +
        e(b, 135, 27, !1, !1) +
        "</a>" +
        f
      );
    if (
      (void 0 !== d.google_conversion_snippets &&
        1 < d.google_conversion_snippets) ||
      3 == d.google_conversion_format
    ) {
      var g = b;
      null == d.google_conversion_domain &&
        (g = 3 == d.google_conversion_format ? b : I(b, "fmt", 3));
      b = void 0;
      lc() && !d.google_remarketing_only && (b = { attributionsrc: "" });
      return Ie(a, c, d, g, b)
        ? f
        : e(g, 1, 1, !0, !d.google_remarketing_only) + f;
    }
    g = null;
    !d.google_conversion_domain &&
      Ie(a, c, d, b) &&
      ((g = "goog_conv_iframe"), (b = ""));
    return (
      Fe(
        "google_conversion_frame",
        "Google conversion frame",
        b,
        2 == d.google_conversion_format ? 200 : 300,
        2 == d.google_conversion_format ? 26 : 13,
        !1,
        g
      ) + f
    );
  }
  function Ie(a, b, c, d, e) {
    if (c.google_conversion_domain) return !1;
    try {
      return Oc(a, b, d, null, e);
    } catch (f) {
      return !1;
    }
  }
  function Je(a) {
    if (
      "landing" === a.google_conversion_type ||
      !a.google_conversion_id ||
      (a.google_remarketing_only && a.google_disable_viewthrough)
    )
      return !1;
    a.google_conversion_date = new Date();
    a.google_conversion_time = a.google_conversion_date.getTime();
    a.google_conversion_snippets =
      "number" === typeof a.google_conversion_snippets &&
      0 < a.google_conversion_snippets
        ? a.google_conversion_snippets + 1
        : 1;
    void 0 === a.google_conversion_first_time &&
      (a.google_conversion_first_time = a.google_conversion_time);
    a.google_conversion_js_version = "9";
    0 != a.google_conversion_format &&
      1 != a.google_conversion_format &&
      2 != a.google_conversion_format &&
      3 != a.google_conversion_format &&
      (a.google_conversion_format = 3);
    !1 !== a.google_enable_display_cookie_match &&
      (a.google_enable_display_cookie_match = !0);
    return !0;
  }
  function Ke(a) {
    for (var b = 0; b < re.length; b++) a[re[b]] = null;
  }
  function Le(a) {
    for (var b = {}, c = 0; c < re.length; c++) b[re[c]] = a[re[c]];
    for (c = 0; c < se.length; c++) b[se[c]] = a[se[c]];
    return b;
  }
  function Be() {
    var a = "";
    kc() &&
      (a = sc()
        .map(function (b) {
          return b.join("-");
        })
        .join("_"));
    return X("li", a);
  }
  function De(a) {
    if (!cc || !a.__gsaExp || !a.__gsaExp.id) return "";
    a = a.__gsaExp.id;
    if ("function" !== typeof a) return "";
    try {
      var b = Number(a());
      return isNaN(b) ? "" : X("gsaexp", b);
    } catch (c) {
      return "";
    }
  }
  function Ee(a) {
    function b(d, e) {
      null != e && c.push(d + "=" + encodeURIComponent(e));
    }
    if (!jc()) return "";
    a = me(a);
    if (!a) return "";
    var c = [];
    b("&uaa", a.architecture);
    b("&uab", a.bitness);
    b("&uam", a.model);
    b("&uap", a.platform);
    b("&uapv", a.platformVersion);
    null != a.wow64 && b("&uaw", a.wow64 ? "1" : "0");
    a.fullVersionList &&
      b(
        "&uafvl",
        a.fullVersionList
          .map(function (d) {
            return (
              encodeURIComponent(d.brand || "") +
              ";" +
              encodeURIComponent(d.version || "")
            );
          })
          .join("|")
      );
    return c.join("");
  }
  function Ce(a) {
    if (!a) return "";
    var b = "",
      c;
    for (c in a) a.hasOwnProperty(c) && (b += X(c, a[c]));
    return b;
  }
  function ye(a) {
    return (a = a.google_gtm_experiments) && a.gbcov ? !0 : !1;
  }
  function Ve(a, b) {
    var c;
    if ((c = !b.google_remarketing_only))
      if (
        b.google_transport_url ||
        !M ||
        ("375603261" != N(19) && "375603260" != N(19))
      )
        c = !1;
      else {
        b: {
          if (!qe) {
            Sb(
              "A4w7HyCK6tScR/6oxyP31X0MsYLu0ZlIdOBV/7GEXwRIQZy3/qaAa0jm3+mKd8mQDUB6svQWIUC2X/gyNdSvbgAAAACUeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZWFkc2VydmljZXMuY29tOjQ0MyIsImZlYXR1cmUiOiJBdHRyaWJ1dGlvblJlcG9ydGluZ0Nyb3NzQXBwV2ViIiwiZXhwaXJ5IjoxNzA3MjYzOTk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ\x3d\x3d",
              a
            );
            if (
              !Hc() &&
              !Sb(
                t("www.googleadservices.com", "endsWith").call(
                  "www.googleadservices.com",
                  "google.com"
                )
                  ? ""
                  : "A2kc5o2ErHAbqJvF2MHSdYtnc2Bp3n6Jn2kNeko6SgHH6zXBHn0+4BbAW2No9ylVJMkzJAPwMqCVHqXm+IF1DgQAAACKeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZWFkc2VydmljZXMuY29tOjQ0MyIsImZlYXR1cmUiOiJQcml2YWN5U2FuZGJveEFkc0FQSXMiLCJleHBpcnkiOjE2OTUxNjc5OTksImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9",
                a
              )
            ) {
              a = !1;
              break b;
            }
            qe = !0;
          }
          a = Hc();
        }
        c = a;
      }
    c &&
      ((a = b.google_additional_conversion_params || {}),
      (c = b.google_gtm_experiments),
      (a.capi = c && c.apcm ? "2" : "1"),
      (b.google_additional_conversion_params = a));
  }
  var Ye = !1,
    Ze = (document.currentScript && document.currentScript.src) || "";
  function $e(a, b, c) {
    try {
      if (!Ye && ((Ye = !0), !c.google_gtm)) {
        var d = void 0,
          e = void 0,
          f = Ib(a.location.href, "gtm_debug");
        af(f) && (d = 2);
        d ||
          0 !== b.referrer.indexOf("https://tagassistant.google.com/") ||
          (d = 3);
        !d && 0 <= za(b.cookie.split("; "), "__TAG_ASSISTANT=x") && (d = 4);
        d ||
          ((e = b.documentElement.getAttribute("data-tag-assistant-present")),
          af(e) && (d = 5));
        if (d) {
          var g = "AW-" + (c.google_conversion_id || "");
          if (!a["google.tagmanager.debugui2.queue"]) {
            a["google.tagmanager.debugui2.queue"] = [];
            var h = cb(
              xa(new y(va, "https://www.googletagmanager.com/debug/bootstrap"))
            );
            c = { id: g, src: "LEGACY", cond: d };
            var l = ab.exec($a(h).toString()),
              n = l[3] || "";
            var p = cb(l[1] + db("?", l[2] || "", c) + db("#", n));
            var m = Tb("SCRIPT", b);
            Kb(m, p);
            var q = b.getElementsByTagName("script")[0];
            q && q.parentNode && q.parentNode.insertBefore(m, q);
          }
          a["google.tagmanager.debugui2.queue"].push({
            messageType: "LEGACY_CONTAINER_STARTING",
            data: { id: g, scriptSource: Ze },
          });
        }
      }
    } catch (H) {}
  }
  function af(a) {
    if (null == a || 0 === a.length) return !1;
    a = Number(a);
    var b = Date.now();
    return a < b + 3e5 && a > b - 9e5;
  }
  function bf(a) {
    return a.prerendering
      ? 3
      : { visible: 1, hidden: 2, prerender: 3, preview: 4, unloaded: 5 }[
          a.visibilityState ||
            a.webkitVisibilityState ||
            a.mozVisibilityState ||
            ""
        ] || 0;
  }
  function cf(a) {
    var b;
    a.visibilityState
      ? (b = "visibilitychange")
      : a.mozVisibilityState
      ? (b = "mozvisibilitychange")
      : a.webkitVisibilityState && (b = "webkitvisibilitychange");
    return b;
  }
  function df(a, b) {
    if (3 == bf(b)) return !1;
    a();
    return !0;
  }
  function ef(a, b) {
    if (!df(a, b)) {
      var c = !1,
        d = cf(b),
        e = function () {
          !c &&
            df(a, b) &&
            ((c = !0),
            b.removeEventListener && b.removeEventListener(d, e, !1));
        };
      d && b.addEventListener && b.addEventListener(d, e, !1);
    }
  }
  function ff(a) {
    var b = t(Object, "assign").call(Object, {}, a);
    a = a.id;
    b = (delete b.id, b);
    if (t(Object, "keys").call(Object, b).length)
      throw Error("Invalid attribute(s): " + t(Object, "keys").call(Object, b));
    a = { id: a };
    if (!Bb.test("span")) throw Error("");
    if ("SPAN" in Db) throw Error("");
    b = void 0;
    var c = "";
    if (a)
      for (l in a)
        if (Object.prototype.hasOwnProperty.call(a, l)) {
          if (!Bb.test(l)) throw Error("");
          var d = a[l];
          if (null != d) {
            var e = void 0;
            var f = l;
            if (d instanceof y) d = xa(d);
            else if ("style" == f.toLowerCase()) {
              var g = typeof d;
              g = ("object" == g && null != d) || "function" == g;
              if (!g) throw Error("");
              if (!(d instanceof F)) {
                g = "";
                for (e in d)
                  if (Object.prototype.hasOwnProperty.call(d, e)) {
                    if (!/^[-_a-zA-Z0-9]+$/.test(e))
                      throw Error("Name allows only [-_a-zA-Z0-9], got: " + e);
                    var h = d[e];
                    null != h &&
                      ((h = Array.isArray(h) ? h.map(mb).join(" ") : mb(h)),
                      (g += e + ":" + h + ";"));
                  }
                d = g ? new F(g, kb) : lb;
              }
              d =
                d instanceof F && d.constructor === F
                  ? d.h
                  : "type_error:SafeStyle";
            } else {
              if (/^on/i.test(f)) throw Error("");
              if (f.toLowerCase() in Cb)
                if (d instanceof D) d = $a(d).toString();
                else if (d instanceof E) d = eb(d);
                else if ("string" === typeof d) d = (hb(d) || jb).g();
                else throw Error("");
            }
            d.j && (d = d.g());
            e = f + '="' + Ja(String(d)) + '"';
            c += " " + e;
          }
        }
    var l = "<span" + c;
    null == b ? (b = []) : Array.isArray(b) || (b = [b]);
    !0 === Xa.span
      ? (l += ">")
      : ((b = Ab(b)), (l += ">" + vb(b).toString() + "</span>"));
    return xb(l);
  }
  M = new (function () {
    var a = [];
    var b = 0,
      c;
    for (c in ic) a[b++] = ic[c];
    a = void 0 === a ? [] : a;
    this.h = {};
    this.g = {};
    for (b = 0; b < a.length; ++b) this.g[a[b]] = "";
  })();
  K(["466465925", "466465926"], Wb, 20);
  jc() && oe();
  M && K(["592230570", "592230571"], Vb, 16);
  kc() && (qc(1), rc());
  function gf(a, b, c) {
    function d(n, p) {
      var m = new Image();
      m.onload = n;
      m.src = p;
    }
    function e() {
      --f;
      if (0 >= f) {
        var n = Jc(a, !1),
          p = n[b];
        p && (delete n[b], (n = p[0]) && n.call && n());
      }
    }
    var f = c.length + 1;
    if (2 == c.length) {
      var g = c[0],
        h = c[1];
      0 <= Gb(g, 0, "rmt_tld", g.search(Hb)) &&
        0 <= Gb(g, 0, "ipr", g.search(Hb)) &&
        !h.match(Eb)[6] &&
        ((h += Fb(g)), (c[1] = I(h, "rmt_tld", "1")));
    }
    for (g = 0; g < c.length; g++) {
      h = c[g];
      var l = Ib(h, "fmt");
      switch (parseInt(l, 10)) {
        case 1:
        case 2:
          (l = a.document.getElementById("goog_conv_iframe")) && !l.src
            ? Gc(h, e, l)
            : d(e, h);
          break;
        case 4:
          Oc(a, a.document, h, e);
          break;
        case 5:
          if (a.navigator && a.navigator.sendBeacon)
            if (a.navigator.sendBeacon(h, "")) {
              e();
              break;
            } else h = I(h, "sendb", 2);
          h = I(h, "fmt", 3);
        default:
          d(e, h);
      }
    }
    e();
  }
  var hf = ["GooglemKTybQhCsO"],
    Y = v;
  hf[0] in Y ||
    "undefined" == typeof Y.execScript ||
    Y.execScript("var " + hf[0]);
  for (var Z; hf.length && (Z = hf.shift()); )
    hf.length || void 0 === gf
      ? Y[Z] && Y[Z] !== Object.prototype[Z]
        ? (Y = Y[Z])
        : (Y = Y[Z] = {})
      : (Y[Z] = gf);
  (function (a, b, c) {
    if (a) {
      $e(a, c, a);
      try {
        if (Je(a)) {
          var d = Le(a);
          M && K(["375603260", "375603261"], dc ? 1 : 0, 19);
          M && K(["512247838", "512247839"], ec ? 1 : 0, 22);
          if (3 == bf(c)) {
            var e = "google_conversion_" + Math.floor(1e9 * Math.random());
            Lb(c, ff({ id: e }));
            ef(function () {
              try {
                Ve(c, d);
                var f = c.getElementById(e);
                if (f) {
                  var g = zc(He(a, b, c, d));
                  if (1 === f.nodeType) {
                    var h = f.tagName;
                    if ("SCRIPT" === h || "STYLE" === h) throw Error("");
                  }
                  f.innerHTML = vb(g);
                }
              } catch (l) {}
            }, c);
          } else Ve(c, d), Lb(c, zc(He(a, b, c, d)));
        }
      } catch (f) {}
      Ke(a);
    }
  })(window, navigator, document);
}.call(this));
