.class Lcom/disneymobile/mocha/NSThread$1$1;
.super Ljava/lang/Object;
.source "NSThread.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/NSThread$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disneymobile/mocha/NSThread$1;


# direct methods
.method constructor <init>(Lcom/disneymobile/mocha/NSThread$1;)V
    .locals 0

    .prologue
    .line 19
    iput-object p1, p0, Lcom/disneymobile/mocha/NSThread$1$1;->this$0:Lcom/disneymobile/mocha/NSThread$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 21
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 22
    return-void
.end method
