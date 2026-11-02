.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lorg/glassfish/grizzly/filterchain/FilterChainEvent;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ContinueEvent"
.end annotation


# instance fields
.field private final context:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V
    .locals 0
    .param p1, "context"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .prologue
    .line 568
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 570
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;->context:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .line 572
    return-void
.end method

.method static synthetic access$300(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;

    .prologue
    .line 560
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;->context:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    return-object v0
.end method


# virtual methods
.method public type()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 580
    const-class v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;

    return-object v0
.end method
