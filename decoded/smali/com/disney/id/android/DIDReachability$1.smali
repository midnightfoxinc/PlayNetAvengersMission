.class Lcom/disney/id/android/DIDReachability$1;
.super Landroid/content/BroadcastReceiver;
.source "DIDReachability.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDReachability;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDReachability;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDReachability;)V
    .locals 0

    .prologue
    .line 14
    iput-object p1, p0, Lcom/disney/id/android/DIDReachability$1;->this$0:Lcom/disney/id/android/DIDReachability;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/disney/id/android/DIDReachability$1;->this$0:Lcom/disney/id/android/DIDReachability;

    invoke-static {v0, p1}, Lcom/disney/id/android/DIDReachability;->access$000(Lcom/disney/id/android/DIDReachability;Landroid/content/Context;)V

    .line 18
    return-void
.end method
