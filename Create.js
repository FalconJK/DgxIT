var Par = function (Responses, ResponsesEmail) {
  this.ResponsesEmail = ResponsesEmail;

  this.IT1 = "falconjk@alum.ccu.edu.tw";
  this.IT2 = "608415065@alum.ccu.edu.tw"

  this.IMG = Responses[0].getResponse().replace("docker pull ", "");
  this.Password = Responses[1].getResponse();
  this.Del = Responses[2].getResponse();

  this.img = this.IMG.split(":");
  this.REP = this.img[0];
  this.TAG = this.img[1];

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
  else if (!CheckPasswordLength(par.Password))
    IlegalPasswordFormat(par)
  else if (!CheckNameFormat(par))
    IlegalContainerName(par)
  else
    SendToAll(par);
}

function CheckEmailOrg(Org) {
  return Org == "alum.ccu.edu.tw";
}

function CheckPasswordLength(Password) {
  return Password.length >= 6;
}
function CheckNameFormat(par) {
  var Container = par.Del;
  var name = Container.split("_")[0];
  var element = Container.split("_").length;

  if (Container != "")
    return name == par.User && element == 3;
  else
    return true;
}

function test() {
  var Password = "65465465465465";
  Logger.log(Password.length >= 6);
}

function SendToAll(par) {
  var emailTO = par.ResponsesEmail + ", " + par.IT1 + ", " + par.IT2;
  var subject = "Re：已收到您的新增Container請求！";
  var body = par.User + " 您好：\n" +
    "Dgx IT小組已經收到您表單\n" +
    "我們將會盡快處理您的需求，請您耐心等候我們的作業時間\n" +
    "請IT人員盡快執行以下指令：\n" +
    "\n" +
    "./run.sh " + par.REP + " " + par.TAG + " " + par.User + " \\\n" + par.Password + " " + par.Del + "\n" +
    "\n\n" +
    "若有任何問題，可以mail給IT人員，或通報 Dgx Station 問題回報區：\n" +
    "\n" +
    "碩一生　林以樂 " + par.IT1 + "\n" +
    "碩一生　賴冠臻 " + par.IT2 + "\n" +
    "\n" +
    "到工學院一館120實驗室也可以找我們\n" +
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
    "碩一生　林以樂 " + par.IT1 + "\n" +
    "碩一生　賴冠臻 " + par.IT2 + "\n" +
    "\n" +
    "或到工學院一館120實驗室找我們\n" +
    "\n" +
    "\n" +
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
    "故無法為您新增Container。\n\n" +
    "若有任何問題，可以mail給IT人員。\n" +
    "\n" +
    "碩一生　林以樂 " + par.IT1 + "\n" +
    "碩一生　賴冠臻 " + par.IT2 + "\n" +
    "\n" +
    "或到工學院一館120實驗室找我們\n" +
    "\n" +
    "\n" +
    "祝 計畫順利  Model都Train得起來  順利畢業\n" +
    "Dgx IT 小組上"
  GmailApp.sendEmail(emailTO, subject, body);
}


function IlegalPasswordFormat(par) {
  var emailTO = par.ResponsesEmail;
  var subject = "Re：申請參數錯誤!";
  var body = par.User + "您好：\n" +
    "Dgx IT小組已經收到您新增Container的請求，\n" +
    "但由於您違反規則第四條：密碼必須至少六位英數字符!\n" +
    "故無法為您新增Container。\n\n" +
    "若有任何問題，可以mail給IT人員。\n" +
    "\n" +
    "碩一生　林以樂 " + par.IT1 + "\n" +
    "碩一生　賴冠臻 " + par.IT2 + "\n" +
    "\n" +
    "或到工學院一館120實驗室找我們\n" +
    "\n" +
    "\n" +
    "祝 計畫順利  Model都Train得起來  順利畢業\n" +
    "Dgx IT 小組上"
  GmailApp.sendEmail(emailTO, subject, body);
}
