.class Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;
.super Lcom/disney/id/android/DIDSessionManagerFailure;
.source "DIDSessionManagerUnrecoverableFailure.java"


# instance fields
.field private keyErrorCategory:Ljava/lang/String;

.field private keyErrorCode:Ljava/lang/String;

.field private status:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "keyErrorCategory"    # Ljava/lang/String;
    .param p2, "keyErrorCode"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/disney/id/android/DIDSessionManagerFailure;-><init>()V

    .line 18
    const/16 v0, 0x190

    iput v0, p0, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;->status:I

    .line 19
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;->keyErrorCategory:Ljava/lang/String;

    .line 20
    iput-object p2, p0, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;->keyErrorCode:Ljava/lang/String;

    .line 21
    return-void
.end method


# virtual methods
.method public getFailureInformation()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 30
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 33
    .local v1, "failureInformation":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "status"

    iget v3, p0, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;->status:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 34
    const-string v2, "keyErrorCategory"

    iget-object v3, p0, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;->keyErrorCategory:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    const-string v2, "keyErrorCode"

    iget-object v3, p0, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;->keyErrorCode:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :goto_0
    return-object v1

    .line 36
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Lorg/json/JSONException;
    const-class v2, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Something went wrong creating failure information"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getLocalizedMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;->keyErrorCode:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDErrorStrings;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isForcedLogout()Z
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x1

    return v0
.end method
