var Hoge;
(function (Hoge) {
    var Greeting = (function () {
        function Greeting() {
        }
        Greeting.prototype.say = function (message) {
            return message;
        };
        return Greeting;
    })();
    Hoge.Greeting = Greeting;
})(Hoge || (Hoge = {}));
//# sourceMappingURL=app.js.map
