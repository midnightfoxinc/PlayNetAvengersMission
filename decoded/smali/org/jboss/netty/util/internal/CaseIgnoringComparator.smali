.class public final Lorg/jboss/netty/util/internal/CaseIgnoringComparator;
.super Ljava/lang/Object;
.source "CaseIgnoringComparator.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/String;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/jboss/netty/util/internal/CaseIgnoringComparator;

.field private static final serialVersionUID:J = 0x3f9701da7c75fa26L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Lorg/jboss/netty/util/internal/CaseIgnoringComparator;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/CaseIgnoringComparator;-><init>()V

    sput-object v0, Lorg/jboss/netty/util/internal/CaseIgnoringComparator;->INSTANCE:Lorg/jboss/netty/util/internal/CaseIgnoringComparator;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lorg/jboss/netty/util/internal/CaseIgnoringComparator;->INSTANCE:Lorg/jboss/netty/util/internal/CaseIgnoringComparator;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 21
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/util/internal/CaseIgnoringComparator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p1, "o1"    # Ljava/lang/String;
    .param p2, "o2"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
