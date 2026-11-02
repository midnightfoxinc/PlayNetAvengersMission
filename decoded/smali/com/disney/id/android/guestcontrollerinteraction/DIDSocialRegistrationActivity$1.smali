.class Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;
.super Lcom/disney/id/android/external/DIDExternalCallback;
.source "DIDSocialRegistrationActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->initExternalLogin()V
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
    .line 150
    iput-object p1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-direct {p0}, Lcom/disney/id/android/external/DIDExternalCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 4

    .prologue
    .line 161
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Cancelled attempt to retrieve external data"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v3}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-static {v0, v1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$300(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lcom/disney/id/android/DIDResponse;)V

    .line 163
    return-void
.end method

.method public onError(Lcom/disney/id/android/DIDException;)V
    .locals 4
    .param p1, "error"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 167
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Error trying to retrieve external data"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/4 v2, -0x1

    iget-object v3, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v3}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v3

    invoke-direct {v1, v2, v3, p1}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    invoke-static {v0, v1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$300(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lcom/disney/id/android/DIDResponse;)V

    .line 170
    return-void
.end method

.method public onExternalData(Lcom/disney/id/android/external/DIDExternalData;)V
    .locals 2
    .param p1, "externalData"    # Lcom/disney/id/android/external/DIDExternalData;

    .prologue
    .line 154
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Successfully retrieved external data, calling loginSocial()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0, p1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$002(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lcom/disney/id/android/external/DIDExternalData;)Lcom/disney/id/android/external/DIDExternalData;

    .line 156
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$1;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$100(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)V

    .line 157
    return-void
.end method
