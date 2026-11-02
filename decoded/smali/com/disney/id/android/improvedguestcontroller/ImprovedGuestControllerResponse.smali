.class public Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;
.super Ljava/lang/Object;
.source "ImprovedGuestControllerResponse.java"


# instance fields
.field private backingJSON:Lorg/json/JSONObject;

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

.field private isConnectivityError:Z

.field private rawJSON:Lorg/json/JSONObject;

.field private statusCode:I


# direct methods
.method public constructor <init>(ILorg/json/JSONObject;Ljava/util/Map;)V
    .locals 3
    .param p1, "statusCode"    # I
    .param p2, "backingJSON"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/json/JSONObject;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p3, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    if-nez p2, :cond_0

    .line 25
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->rawJSON:Lorg/json/JSONObject;

    .line 26
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->isConnectivityError:Z

    .line 40
    :goto_0
    return-void

    .line 28
    :cond_0
    iput p1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->statusCode:I

    .line 29
    iput-object p3, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->headers:Ljava/util/Map;

    .line 30
    iput-object p2, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->rawJSON:Lorg/json/JSONObject;

    .line 31
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->isConnectivityError:Z

    .line 34
    :try_start_0
    iget-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->rawJSON:Lorg/json/JSONObject;

    const-string v2, "data"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->backingJSON:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :goto_1
    new-instance v1, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    iget-object v2, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->rawJSON:Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;-><init>(Lorg/json/JSONObject;)V

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->error:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    goto :goto_0

    .line 35
    :catch_0
    move-exception v0

    .line 36
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->backingJSON:Lorg/json/JSONObject;

    goto :goto_1
.end method

.method public constructor <init>(Lcom/disney/id/android/volley/NetworkResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/disney/id/android/volley/NetworkResponse;

    .prologue
    const/4 v0, 0x0

    .line 43
    if-nez p1, :cond_0

    const/16 v1, 0x190

    move v2, v1

    :goto_0
    if-nez p1, :cond_1

    move-object v1, v0

    :goto_1
    if-nez p1, :cond_2

    :goto_2
    invoke-direct {p0, v2, v1, v0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;-><init>(ILorg/json/JSONObject;Ljava/util/Map;)V

    .line 46
    return-void

    .line 43
    :cond_0
    iget v1, p1, Lcom/disney/id/android/volley/NetworkResponse;->statusCode:I

    move v2, v1

    goto :goto_0

    :cond_1
    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/DIDNetworkResponseUtils;->getJSONObjectFromResponseSilently(Lcom/disney/id/android/volley/NetworkResponse;)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_1

    :cond_2
    iget-object v0, p1, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    goto :goto_2
.end method


# virtual methods
.method public getData()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->backingJSON:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getError()Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->error:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    return-object v0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public getRawResponse()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->rawJSON:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->statusCode:I

    return v0
.end method

.method public hasData()Z
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->backingJSON:Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasError()Z
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->error:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->hasData()Z

    move-result v0

    return v0
.end method

.method public isConnectivityError()Z
    .locals 1

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->isConnectivityError:Z

    return v0
.end method
