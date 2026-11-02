.class public Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lorg/glassfish/grizzly/filterchain/FilterChainEvent;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GracefulCloseEvent"
.end annotation


# instance fields
.field private final httpTxContext:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V
    .locals 0
    .param p1, "httpTxContext"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .prologue
    .line 595
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 596
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;->httpTxContext:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .line 597
    return-void
.end method


# virtual methods
.method public getHttpTxContext()Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .locals 1

    .prologue
    .line 600
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;->httpTxContext:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    return-object v0
.end method

.method public type()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 605
    const-class v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;

    return-object v0
.end method
