.class public Lcom/disney/id/android/guestcontroller/GuestControllerResponse;
.super Ljava/lang/Object;
.source "GuestControllerResponse.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;,
        Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;
    }
.end annotation


# static fields
.field public static final ETAG:Ljava/lang/String; = "eTag"

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


# instance fields
.field private data:Lorg/json/JSONObject;

.field private error:Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "error"
    .end annotation
.end field

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

.field private keyError:Ljava/lang/String;

.field private raw:Lorg/json/JSONObject;

.field private statusCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 17
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "GC_CODE_OR_CONFIG_ERROR"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "SYSTEM_UNAVAILABLE"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "UNKNOWN_ERROR"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "SERVICE_UNAVAILABLE"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->KEY_CATEGORIES_INDICATING_SUCCESS_FALSE:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 188
    return-void
.end method

.method private isCurrentErrorNotLastInCollection(Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;Ljava/util/List;)Z
    .locals 2
    .param p1, "error"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;",
            "Ljava/util/List",
            "<",
            "Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 130
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    invoke-interface {p2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getData()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->data:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->error:Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    return-object v0
.end method

.method public getErrorCodes()Ljava/lang/String;
    .locals 6

    .prologue
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->hasErrors()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 112
    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getErrors()Ljava/util/ArrayList;

    move-result-object v2

    .line 113
    .local v2, "errors":Ljava/util/List;, "Ljava/util/List<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;

    .line 114
    .local v1, "currentError":Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;
    invoke-virtual {v1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->getCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {v1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->getInputName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 116
    const-string v4, ":"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->getInputName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    :cond_1
    invoke-direct {p0, v1, v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isCurrentErrorNotLastInCollection(Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 121
    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 126
    .end local v1    # "currentError":Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;
    .end local v2    # "errors":Ljava/util/List;, "Ljava/util/List<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    return-object v4
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
    .line 42
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public getKeyError()Ljava/lang/String;
    .locals 5

    .prologue
    .line 85
    iget-object v3, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->keyError:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 86
    iget-object v3, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->keyError:Ljava/lang/String;

    .line 96
    :goto_0
    return-object v3

    .line 87
    :cond_0
    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->hasErrors()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 88
    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getErrors()Ljava/util/ArrayList;

    move-result-object v1

    .line 89
    .local v1, "errors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;

    .line 90
    .local v0, "error":Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;
    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->getCategory()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 91
    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->getCode()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->keyError:Ljava/lang/String;

    .line 96
    .end local v0    # "error":Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;
    .end local v1    # "errors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_2
    iget-object v3, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->keyError:Ljava/lang/String;

    goto :goto_0
.end method

.method public getRaw()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->raw:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->statusCode:I

    return v0
.end method

.method public hasData()Z
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->data:Lorg/json/JSONObject;

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
    .line 78
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->error:Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSuccess()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 100
    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v2

    if-nez v2, :cond_1

    .line 106
    :cond_0
    :goto_0
    return v1

    .line 104
    :cond_1
    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "keyCategory":Ljava/lang/String;
    sget-object v2, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->KEY_CATEGORIES_INDICATING_SUCCESS_FALSE:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setData(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->data:Lorg/json/JSONObject;

    .line 63
    return-void
.end method

.method public setError(Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;)V
    .locals 0
    .param p1, "error"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->error:Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    .line 71
    return-void
.end method

.method public setHeaders(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->headers:Ljava/util/Map;

    .line 47
    return-void
.end method

.method public setRaw(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "raw"    # Lorg/json/JSONObject;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->raw:Lorg/json/JSONObject;

    .line 39
    return-void
.end method

.method public setStatusCode(I)V
    .locals 0
    .param p1, "statusCode"    # I

    .prologue
    .line 54
    iput p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->statusCode:I

    .line 55
    return-void
.end method
