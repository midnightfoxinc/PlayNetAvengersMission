.class Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;
.super Lcom/disney/id/android/DIDSessionManagerFailure;
.source "DIDSessionManagerRecoverableFailure.java"


# static fields
.field private static final PPU_ACTIONABLE_INPUT_CATEGORY:Ljava/lang/String; = "PPU_ACTIONABLE_INPUT"


# instance fields
.field private error:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

.field private headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private rawInformation:Lorg/json/JSONObject;

.field private status:I


# direct methods
.method constructor <init>(ILjava/util/Map;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "status"    # I
    .param p3, "rawInformation"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .prologue
    .line 31
    .local p2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    invoke-direct {v0, p3}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;-><init>(Lorg/json/JSONObject;)V

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;-><init>(ILjava/util/Map;Lorg/json/JSONObject;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;)V

    .line 32
    return-void
.end method

.method constructor <init>(ILjava/util/Map;Lorg/json/JSONObject;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;)V
    .locals 1
    .param p1, "status"    # I
    .param p3, "rawInformation"    # Lorg/json/JSONObject;
    .param p4, "error"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    .local p2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/disney/id/android/DIDSessionManagerFailure;-><init>()V

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->headers:Ljava/util/Map;

    .line 35
    iput p1, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->status:I

    .line 36
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->headers:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 37
    iput-object p3, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->rawInformation:Lorg/json/JSONObject;

    .line 38
    iput-object p4, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->error:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    .line 39
    return-void
.end method

.method static getDefaultError()Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;
    .locals 4

    .prologue
    .line 27
    new-instance v0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;

    const/16 v1, 0x190

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;-><init>(ILjava/util/Map;Lorg/json/JSONObject;)V

    return-object v0
.end method


# virtual methods
.method public getFailureInformation()Lorg/json/JSONObject;
    .locals 7

    .prologue
    .line 48
    iget-object v4, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->error:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    invoke-virtual {v4}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCategory()Ljava/lang/String;

    move-result-object v2

    .line 49
    .local v2, "keyErrorCategory":Ljava/lang/String;
    iget-object v4, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->error:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    invoke-virtual {v4}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCode()Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "keyErrorCode":Ljava/lang/String;
    const-string v4, "PPU_ACTIONABLE_INPUT"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "PPU_LEGAL"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "PPU_MARKETING"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 54
    const/4 v0, 0x0

    .line 66
    :goto_0
    return-object v0

    .line 57
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 59
    .local v0, "actionableInformation":Lorg/json/JSONObject;
    :try_start_0
    const-string v4, "headers"

    new-instance v5, Lorg/json/JSONObject;

    iget-object v6, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->headers:Ljava/util/Map;

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    const-string v4, "status"

    iget v5, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->status:I

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 61
    const-string v4, "response"

    iget-object v5, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->rawInformation:Lorg/json/JSONObject;

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 62
    :catch_0
    move-exception v1

    .line 63
    .local v1, "e":Lorg/json/JSONException;
    const-class v4, Lcom/disney/id/android/DIDSessionManagerFailure;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Something went wrong creating actionable information. Whatever we send to Lightbox may be invalid."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getLocalizedMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->error:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCategory()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDErrorStrings;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isForcedLogout()Z
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x0

    return v0
.end method
