.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "BodyHandlerFactory"
.end annotation


# instance fields
.field private final HANDLERS:[Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1688
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1690
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    const/4 v1, 0x0

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StringBodyHandler;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {v2, v3, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StringBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ByteArrayBodyHandler;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {v2, v3, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ByteArrayBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ParamsBodyHandler;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {v2, v3, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ParamsBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StreamDataBodyHandler;

    invoke-direct {v2, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StreamDataBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;

    invoke-direct {v2, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {v2, v3, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyGeneratorBodyHandler;

    invoke-direct {v2, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyGeneratorBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;->HANDLERS:[Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 1688
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V

    return-void
.end method


# virtual methods
.method public getBodyHandler(Lcom/ning/http/client/Request;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    .locals 5
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 1701
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;->HANDLERS:[Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    .local v0, "arr$":[Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 1702
    .local v1, "h":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    invoke-virtual {v1, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;->handlesBodyType(Lcom/ning/http/client/Request;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1707
    .end local v1    # "h":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    :goto_1
    return-object v1

    .line 1701
    .restart local v1    # "h":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1707
    .end local v1    # "h":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method
