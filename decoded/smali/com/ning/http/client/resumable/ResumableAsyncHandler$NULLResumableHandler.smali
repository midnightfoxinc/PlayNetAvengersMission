.class Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableHandler;
.super Ljava/lang/Object;
.source "ResumableAsyncHandler.java"

# interfaces
.implements Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/resumable/ResumableAsyncHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NULLResumableHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/resumable/ResumableAsyncHandler$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/resumable/ResumableAsyncHandler$1;

    .prologue
    .line 272
    invoke-direct {p0}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public load()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 288
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method

.method public put(Ljava/lang/String;J)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "transferredBytes"    # J

    .prologue
    .line 276
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 280
    return-void
.end method

.method public save(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 284
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    return-void
.end method
