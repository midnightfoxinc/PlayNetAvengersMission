.class public Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;
.super Ljava/lang/Object;
.source "ImprovedGuestControllerError.java"


# static fields
.field private static final KEY_CATEGORIES_INDICATING_SUCCESS_FALSE:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final NON_CRITICAL_GUEST_CONTROLLER_ERRORS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private backingJSON:Lorg/json/JSONObject;

.field private errors:Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 16
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "GC_CODE_OR_CONFIG_ERROR"

    aput-object v1, v0, v2

    const-string v1, "SYSTEM_UNAVAILABLE"

    aput-object v1, v0, v3

    const-string v1, "UNKNOWN_ERROR"

    aput-object v1, v0, v4

    const-string v1, "SERVICE_UNAVAILABLE"

    aput-object v1, v0, v5

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->KEY_CATEGORIES_INDICATING_SUCCESS_FALSE:Ljava/util/List;

    .line 17
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "AUTHORIZATION_UNEXPECTED_ERROR"

    aput-object v1, v0, v2

    const-string v1, "AUTHORIZATION_INVALID_REFRESH_TOKEN"

    aput-object v1, v0, v3

    const-string v1, "S2_COOKIE_GENERATION_ERROR"

    aput-object v1, v0, v4

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->NON_CRITICAL_GUEST_CONTROLLER_ERRORS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 1
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 36
    iget-object v0, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    invoke-static {v0}, Lcom/disney/id/android/improvedguestcontroller/DIDNetworkResponseUtils;->getJSONObjectFromResponseSilently(Lcom/disney/id/android/volley/NetworkResponse;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;-><init>(Lorg/json/JSONObject;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "backingJSON"    # Lorg/json/JSONObject;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    :try_start_0
    const-string v1, "error"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->backingJSON:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    :goto_0
    new-instance v1, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;

    iget-object v2, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->backingJSON:Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;-><init>(Lorg/json/JSONObject;)V

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->errors:Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;

    .line 33
    return-void

    .line 28
    :catch_0
    move-exception v0

    .line 29
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->backingJSON:Lorg/json/JSONObject;

    goto :goto_0
.end method


# virtual methods
.method public getFormattedErrors()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->errors:Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;

    invoke-virtual {v0}, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;->getFormattedErrors()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKeyErrorCategory()Ljava/lang/String;
    .locals 3

    .prologue
    .line 49
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->backingJSON:Lorg/json/JSONObject;

    const-string v1, "keyCategory"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKeyErrorCode()Ljava/lang/String;
    .locals 3

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCategory()Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "keyCategory":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 42
    const/4 v1, 0x0

    .line 45
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->errors:Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;

    invoke-virtual {v1, v0}, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;->getFirstErrorMatchingCategory(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "code"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public hasData()Z
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->backingJSON:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCriticalError()Z
    .locals 2

    .prologue
    .line 67
    sget-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->NON_CRITICAL_GUEST_CONTROLLER_ERRORS:Ljava/util/List;

    invoke-virtual {p0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCode()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSuccess()Z
    .locals 2

    .prologue
    .line 57
    sget-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->KEY_CATEGORIES_INDICATING_SUCCESS_FALSE:Ljava/util/List;

    invoke-virtual {p0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCategory()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
