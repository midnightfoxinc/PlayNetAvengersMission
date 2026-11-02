.class Lcom/disney/id/android/AdditionalAction;
.super Ljava/lang/Object;
.source "AdditionalAction.java"


# instance fields
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
    .line 19
    .local p2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/AdditionalAction;->headers:Ljava/util/Map;

    .line 20
    iput p1, p0, Lcom/disney/id/android/AdditionalAction;->status:I

    .line 21
    iget-object v0, p0, Lcom/disney/id/android/AdditionalAction;->headers:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 22
    iput-object p3, p0, Lcom/disney/id/android/AdditionalAction;->rawInformation:Lorg/json/JSONObject;

    .line 23
    return-void
.end method


# virtual methods
.method getInformation()Lorg/json/JSONObject;
    .locals 5

    .prologue
    .line 26
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 28
    .local v0, "actionableInformation":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "headers"

    new-instance v3, Lorg/json/JSONObject;

    iget-object v4, p0, Lcom/disney/id/android/AdditionalAction;->headers:Ljava/util/Map;

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    const-string v2, "status"

    iget v3, p0, Lcom/disney/id/android/AdditionalAction;->status:I

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 30
    const-string v2, "response"

    iget-object v3, p0, Lcom/disney/id/android/AdditionalAction;->rawInformation:Lorg/json/JSONObject;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :goto_0
    return-object v0

    .line 31
    :catch_0
    move-exception v1

    .line 32
    .local v1, "e":Lorg/json/JSONException;
    const-class v2, Lcom/disney/id/android/DIDSessionManagerFailure;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Something went wrong creating actionable information. Whatever we send to Lightbox may be invalid."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
