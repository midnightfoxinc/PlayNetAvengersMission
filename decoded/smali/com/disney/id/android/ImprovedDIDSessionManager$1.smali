.class Lcom/disney/id/android/ImprovedDIDSessionManager$1;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;


# direct methods
.method constructor <init>(Lcom/disney/id/android/ImprovedDIDSessionManager;)V
    .locals 0

    .prologue
    .line 51
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$1;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$1;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    const-string v1, "event:token:refresh"

    invoke-static {v0, v1}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$000(Lcom/disney/id/android/ImprovedDIDSessionManager;Ljava/lang/String;)V

    .line 55
    return-void
.end method
