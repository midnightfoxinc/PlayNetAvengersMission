.class public Lcom/disney/emagine/sdk/apple/NSAssert;
.super Ljava/lang/Object;
.source "NSAssert.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/disney/emagine/sdk/apple/NSAssert;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/apple/NSAssert;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;)V
    .locals 2
    .param p1, "result"    # Z
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    if-nez p1, :cond_0

    .line 22
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    sget-object v1, Lcom/disney/emagine/sdk/apple/NSAssert;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 26
    :cond_0
    return-void
.end method
