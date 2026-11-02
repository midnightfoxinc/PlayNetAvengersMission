.class Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$3;
.super Ljava/lang/Object;
.source "DIDSocialRegistrationActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->handleSocialLoginError(Lorg/json/JSONObject;ILjava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;


# direct methods
.method constructor <init>(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)V
    .locals 0

    .prologue
    .line 385
    iput-object p1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$3;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 388
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Handling a social registration error. Need to open up an instance of LightBox!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$3;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->setVisible(Z)V

    .line 390
    new-instance v0, Lcom/disney/id/android/DIDActivityLauncher;

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$3;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$600(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-direct {v0, v1, v2}, Lcom/disney/id/android/DIDActivityLauncher;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$3;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDActivityLauncher;->attemptLaunch(Lcom/disney/id/android/DIDRequest;)V

    .line 391
    return-void
.end method
