
// 스마트에디터 설정입니다.
let oEditors = []

smartEditor = function () {
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "./static/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
    });
}

$(document).ready(function () {
    smartEditor()
});