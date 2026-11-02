.class Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;
.super Ljava/lang/Object;
.source "GuestControllerErrors.java"


# instance fields
.field private backingJSON:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "error"    # Lorg/json/JSONObject;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    :try_start_0
    const-string v1, "errors"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;->backingJSON:Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    :goto_0
    return-void

    .line 19
    :catch_0
    move-exception v0

    .line 20
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;->backingJSON:Lorg/json/JSONArray;

    goto :goto_0
.end method


# virtual methods
.method getFirstErrorMatchingCategory(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 25
    iget-object v4, p0, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;->backingJSON:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 26
    .local v3, "size":I
    const/4 v1, 0x0

    .line 28
    .local v1, "firstErrorMatchingCategory":Lorg/json/JSONObject;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 29
    iget-object v4, p0, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;->backingJSON:Lorg/json/JSONArray;

    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 30
    .local v0, "currentError":Lorg/json/JSONObject;
    if-eqz v0, :cond_1

    const-string v4, "category"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 31
    move-object v1, v0

    .line 36
    .end local v0    # "currentError":Lorg/json/JSONObject;
    :cond_0
    return-object v1

    .line 28
    .restart local v0    # "currentError":Lorg/json/JSONObject;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method getFormattedErrors()Ljava/lang/String;
    .locals 6

    .prologue
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v5, p0, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;->backingJSON:Lorg/json/JSONArray;

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v4

    .line 43
    .local v4, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_2

    .line 44
    iget-object v5, p0, Lcom/disney/id/android/improvedguestcontroller/GuestControllerErrors;->backingJSON:Lorg/json/JSONArray;

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 46
    .local v1, "error":Lorg/json/JSONObject;
    const-string v5, "inputName"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 47
    .local v3, "inputName":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 48
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 52
    const/16 v5, 0x2c

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 43
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 56
    .end local v1    # "error":Lorg/json/JSONObject;
    .end local v3    # "inputName":Ljava/lang/String;
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
