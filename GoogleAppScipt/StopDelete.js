var Par = function (Responses, ResponsesEmail) {
    this.ResponsesEmail = ResponsesEmail;

    this.IT1email = "falconjk@alum.ccu.edu.tw";
    this.IT2email = "608415065@alum.ccu.edu.tw";

    this.IT1 = "碩一生　林以樂 " + this.IT1email;
    this.IT2 = "碩一生　賴冠臻 " + this.IT2email;

    this.Action = Responses[0].getResponse();
    this.Container = Responses[1].getResponse();

    if (this.Action == "停止") {
        this.dockerdo = "./stop.sh";
    } else if (this.Action == "刪除") {
        this.dockerdo = "./del.sh"
    }

    this.email = ResponsesEmail.split("@");
    this.User = this.email[0];
    this.Org = this.email[1];
};

function getParameters(e) {
    var Responses = e.response.getItemResponses();
    var ResponsesEmail = e.response.getRespondentEmail();

    var parameter = new Par(Responses, ResponsesEmail);

    main(parameter);
}

function main(par) {
    if (!CheckEmailOrg(par.Org))
        IlegalEmailFormat(par);
    else if (!CheckNameFormat(par))
        IlegalContainerName(par);
    else
        SendToAll(par);
}

function CheckEmailOrg(Org) {
    return Org.indexOf('ccu') >= 0;
}

function CheckNameFormat(par) {
    var Container = par.Container;
    var name = Container.split("_")[0];
    var element = Container.split("_").length;

    if (Container != "")
        return name == par.User && element == 3;
    else
        return true;
}

function SendToAll(par) {
    var emailTO = par.ResponsesEmail + ", " + par.IT1email + ", " + par.IT2email;
    var subject = "Re：已收到您的" + par.Action + "Container請求！"
    var body = par.User + " 您好：\n" +
        "Dgx IT小組已經收到您表單\n" +
        "我們將會盡快處理您的需求，請您耐心等候我們的作業時間\n" +
        "請IT人員盡快執行以下指令：\n" +
        "\n" +
        par.dockerdo + " " + par.Container + "\n" +
        "\n" +
        "若有任何問題，可以mail給IT人員，或通報 Dgx Station 問題回報區：\n" +
        "\n" +
        par.IT1 + "\n" +
        par.IT2 + "\n" +
        "\n" +
        "到工學院一館120實驗室也可以找我們\n" +
        "祝 計畫順利  Model都Train得起來  順利畢業\n" +
        "Dgx IT 小組上"
    GmailApp.sendEmail(emailTO, subject, body);
}

function IlegalEmailFormat(par) {
    var emailTO = par.ResponsesEmail;
    var subject = "Re：無法為您完成動作!";
    var body = par.User + "您好：\n" +
        "Dgx IT小組已經收到您新增Container的請求，\n" +
        "但由於您違反規則第一條：必須使用CCU校友GSuit信箱申請!\n" +
        "故無法為您" + par.Action + par.Container + "Container。\n\n" +
        "若有任何問題，可以mail給IT人員。\n" +
        "\n" +
        par.IT1 + "\n" +
        par.IT2 + "\n" +
        "\n" +
        "或到工學院一館120實驗室找我們\n" +
        "\n" +
        "\n" +
        "祝 計畫順利  Model都Train得起來  順利畢業\n" +
        "Dgx IT 小組上"
    GmailApp.sendEmail(emailTO, subject, body);
}

function IlegalContainerName(par) {
    var emailTO = par.ResponsesEmail;
    var subject = "Re：申請參數錯誤!";
    var body = par.User + "您好：\n" +
        "Dgx IT小組已經收到您處理Container的請求，\n" +
        "但由於您傳送的Container Name，已違反Containe的命名規則\n" +
        "系統已自動過濾，故無法為您處理相關Container的動作。\n" +
        "請您輸入正確的Container Name，\n\n" +
        "若有任何問題，可以mail給IT人員。\n" +
        "\n" +
        par.IT1 + "\n" +
        par.IT2 + "\n" +
        "\n" +
        "或到工學院一館120實驗室找我們\n" +
        "\n" +
        "\n" +
        "祝 計畫順利  Model都Train得起來  順利畢業\n" +
        "Dgx IT 小組上"
    GmailApp.sendEmail(emailTO, subject, body);
}
